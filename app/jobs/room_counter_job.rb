class RoomCounterJob
  include SuckerPunch::Job
  workers 2

  def perform(args)
    synchronous(args)
  end

  def self.synchronous(args)
    room_stats = $redis.hgetall("r_#{room.id}")

    c_avg = calc_avg("c", c_rating, room_stats)
    n_avg = calc_avg("n", n_rating, room_stats)
    l_avg = calc_avg("l", l_rating, room_stats)
    s_avg = calc_avg("s", s_rating, room_stats)
    room.update(cleanliness: c_avg, noisiness: n_avg, light: l_avg, social: s_avg)
  end

  def self.calc_avg(attr, rating, room_stats)
    if room_stats["#{attr}_sum"].nil? || room_stats["#{attr}_n"].nil?
      if rating.nil?
        return 3.0
      else
        return rating
      end
    else
      if rating.nil?
        return room_stats["#{attr}_sum"].to_f / room_stats["#{attr}_n"].to_f
      else
        return (room_stats["#{attr}_sum"].to_f + rating.to_f) / (room_stats["#{attr}_n"].to_f + 1)
      end
    end
  end

end
