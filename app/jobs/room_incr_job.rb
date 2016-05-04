class RoomIncrJob
  include SuckerPunch::Job
  workers 2

  def perform(args)
    synchronous(args)
  end

  def self.synchronous(args)
    room = args[:room]
    c_rating = args[:cleanliness]
    n_rating = args[:noisiness]
    l_rating = args[:light]
    s_rating = args[:socialness]
    room_stats = $redis.hgetall("r_#{room.id}")
    $redis.pipelined do
      incrby("c", c_rating, room.id)
      incrby("n", n_rating, room.id)
      incrby("l", l_rating, room.id)
      incrby("s", s_rating, room.id)
    end
  end


  def self.incrby(attr, rating, room_id)
    unless rating.nil?
      $redis.hincrby("r_#{room_id}", "#{attr}_n", "1")
      $redis.hincrby("r_#{room_id}", "#{attr}_sum", rating.to_i.to_s)
    end
  end
end
