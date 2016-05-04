class TagCounterJob
  include SuckerPunch::Job
  workers 2

  def perform(args)
    building_id = args[:building_id]
    tags = args[:tags]
    $redis.pipelined do
      begin
        tags.keys.each do |tag, count|
          $redis.hincrby("b_#{building_id}", tag, count)
        end
      rescue
        tags.each do |tag|
          $redis.hincrby("b_#{building_id}", tag, "1")
        end
      end
    end
  end
end
