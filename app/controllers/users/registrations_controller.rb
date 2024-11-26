class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      if resource.persisted? && resource.phone.present?
        generate_verification_code(resource)
      end
    end
  end

  protected

  def after_sign_up_path_for(resource)
    flash[:notice] = 'A verification code has been sent to your phone.'
    verify_phone_path
  end

  private

  def generate_verification_code(resource)
    verification_code = rand(100000..999999)
    expiration_time = Time.now + 1.minute

    notification = Notification.create!(
      user: resource,
      message: "Use verification code #{verification_code} for Hello Tractor authentication."
    )

    resource.update(
      phone_verification_code: verification_code,
      phone_verification_code_expires_at: expiration_time
    )

    send_verification_code(notification)
  end

  def send_verification_code(notification)
    SendSmsWorker.perform_async(notification.id)
  rescue StandardError => e
    Rails.logger.error("Failed to send verification SMS: #{e.message}")
  end
end
