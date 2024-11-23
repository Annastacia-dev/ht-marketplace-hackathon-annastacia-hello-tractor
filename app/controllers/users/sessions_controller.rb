class Users::SessionsController < Devise::SessionsController
  def create
    super do |resource|
      if !resource.is_phone_verified?
        send_verification_code(resource)
        redirect_to verify_phone_path and return
      end
    end
  end

  protected

  def send_verification_code(resource)
    verification_code = rand(100000..999999)

    notification = Notification.create!(
      user: resource,
      message: "Your verification code is #{verification_code}"
    )

    resource.update(
      phone_verification_code: verification_code,
      phone_verification_code_expires_at: Time.now + 5.minutes
    )

    SendSmsWorker.perform_async(notification.id)
  rescue StandardError => e
    Rails.logger.error("Failed to send verification SMS: #{e.message}")
  end
end
