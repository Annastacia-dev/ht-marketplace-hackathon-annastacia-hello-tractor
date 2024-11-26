require './lib/modules/africastalking'

class Notifications::SendSms < ApplicationService
  attr_reader :notification

  def initialize(notification_id)
    super()
    @notification = Notification.find(notification_id)
    @failure_reasons = []
  end

  def call
    logger.info '[Service] Notification::SendSms called'

    send_sms
  end

  private

  def send_sms
    return if notification.nil?

    user = notification.user
    request = Modules::Africastalking.send_sms(
      message: notification.message,
      to: user.phone
    )

    puts request[0].status


    if request[0].status == 'Success'
      puts 'SMS sent successfully'
    else
      puts 'Failed to send SMS'
      @failure_reasons << "#{request[0].status} - #{request[0].number} for #{user.name}"
    end
  end
end
