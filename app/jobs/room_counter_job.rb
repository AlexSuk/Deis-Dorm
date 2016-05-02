class RoomCounterJob
  include SuckerPunch::Job
  workers 4

  def perform(args)
    room = args[:room]
    c_rating = args[:cleanliness]
    n_rating = args[:noisiness]
    l_rating = args[:light]
    s_rating = args[:socialness]
    room_stats = $redis.hgetall("r_#{room.id}")

    c_avg = calc_avg("c", c_rating, room_stats)
    n_avg = calc_avg("n", n_rating, room_stats)
    l_avg = calc_avg("l", l_rating, room_stats)
    s_avg = calc_avg("s", s_rating, room_stats)

    room.update(cleanliness: c_avg, noisiness: n_avg, light: l_avg, socialness: s_avg)

    $redis.pipelined do
      incrby("c", c_rating, room.id)
      incrby("n", n_rating, room.id)
      incrby("l", l_rating, room.id)
      incrby("s", s_rating, room.id)
      # unless n_rating.nil?
      #   $redis.hincrby("r_#{room.id}", "n_n", "1")
      #   $redis.hincrby("r_#{room.id}", "n_sum", n_rating.to_s)
      # end
    end
  end

  def calc_avg(attr, rating, roomd_stats)
    avg = 0.0
    if rating == 0
      avg = room_stats["#{attr}_sum"].to_f / room_stats["#{attr}_n"].to_f
    else
      avg = (room_stats["#{attr}_sum"].to_f + rating.to_f) / (room_stats["#{attr}_n"].to_f + 1)
    end
    return avg
  end

  def incrby(attr, rating, room_id)
    unless rating.nil?
      $redis.hincrby("r_#{room_id}", "#{attr}_n", "1")
      $redis.hincrby("r_#{room_id}", "#{attr}_sum", rating.to_s)
    end
  end
end
