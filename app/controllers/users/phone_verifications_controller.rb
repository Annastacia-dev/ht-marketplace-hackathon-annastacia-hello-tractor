class Users::PhoneVerificationsController < ApplicationController
  before_action :authenticate_user!

  def verify
    if current_user.phone_verification_code_expires_at.nil? || current_user.phone_verification_code_expires_at < Time.now
      flash[:alert] = 'The verification code has expired. Please request a new one.'
      redirect_to verify_phone_path
    elsif current_user.phone_verification_code == params[:phone_verification_code]
      current_user.update(phone_verified_at: Time.now, phone_verification_code: nil, phone_verification_code_expires_at: nil)

      sign_in(current_user, bypass: true)

      flash[:success] = 'Phone number verified successfully.'
      redirect_to root_path
    else
      flash[:alert] = 'Invalid verification code.'
      redirect_to verify_phone_path
    end
  end

  def resend_code
    verification_code = rand(100000..999999)
    expiration_time = Time.now + 5.minutes

    notification = Notification.create!(
      user: current_user,
      message: "Use verification code #{verification_code} for Hello Tractor authentication."
    )

    current_user.update(
      phone_verification_code: verification_code,
      phone_verification_code_expires_at: expiration_time
    )

    send_verification_code(notification)

    flash[:notice] = 'A new verification code has been sent to your phone.'
    redirect_to verify_phone_path
  end

  private

  def send_verification_code(notification)
    SendSmsWorker.perform_async(notification.id)
  rescue StandardError => e
    Rails.logger.error("Failed to send verification SMS: #{e.message}")
  end
end
