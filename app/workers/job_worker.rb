class JobWorker
  include Sidekiq::Worker

  def perform()
    logger.info '[Worker] Job Worker called'

  end
end