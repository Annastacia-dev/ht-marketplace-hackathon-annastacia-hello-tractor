class SendSmsWorker
  include Sidekiq::Worker

  def perform(notification_id)
    logger.info '[Worker] SendSMS called'

    Notifications::SendSms.new(notification_id).call
  end
end
