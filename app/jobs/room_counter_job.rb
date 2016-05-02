class TagCounterJob
  include SuckerPunch::Job
  workers 4

  def perform(args)
    room_id = args[:room_id]
    c_rating =
    n_rating = args[:noisiness]
    l_rating = args[:light]
    s_rating = args[:socialness]
    $redis.pipelined do
      unless c_rating.nil?
        $redis.hincrby("r_#{room_id}", "c_n", "1")
        $redis.hincrby("r_#{room_id}", "c_sum", c_rating.to_s)
      end
      unless n_rating.nil?
        $redis.hincrby("r_#{room_id}", "n_n", "1")
        $redis.hincrby("r_#{room_id}", "n_sum", n_rating.to_s)
      end
      unless l_rating.nil?
        $redis.hincrby("r_#{room_id}", "l_n", "1")
        $redis.hincrby("r_#{room_id}", "l_sum", l_rating.to_s)
      end
      unless s_rating.nil?
        $redis.hincrby("r_#{room_id}", "s_n", "1")
        $redis.hincrby("r_#{room_id}", "s_sum", s_rating.to_s)
      end
    end

  end
end
