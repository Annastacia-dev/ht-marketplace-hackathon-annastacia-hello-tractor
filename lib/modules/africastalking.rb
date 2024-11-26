require 'AfricasTalking'

module Modules
  class Africastalking
    def initialize
      if Rails.env.production?
        username = ENV.fetch('AT_PROD_USERNAME')
        api_key = ENV.fetch('AT_PROD_API_KEY')
      else
        username = ENV.fetch('AT_PROD_USERNAME')
        api_key = ENV.fetch('AT_PROD_API_KEY')
      end

      at = AfricasTalking::Initialize.new(username, api_key)
      @sms = at.sms
    end

    def self.send_sms(**options)
      new.send_sms(**options)
    end

    def send_sms(**options)
      message = options[:message]
      to = options[:to]

      @sms.send(
        'to' => to,
        'message' => message,
        'retryDurationInHours' => 1
      )
    end
  end
end
