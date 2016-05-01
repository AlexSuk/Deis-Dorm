class CounterJob
  include SuckerPunch::Job
  workers 4

  def perform(args)
    building_id = args[:b_id]
    tags = args[:tags]
    

  end
end
