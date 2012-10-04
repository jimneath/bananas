class SleepWorker
  @queue = :sleep
  
  def perform
    sleep 10
  end
end