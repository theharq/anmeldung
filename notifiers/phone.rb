require "twilio-ruby"

class Phone
  ACCOUNT_SID = ENV.fetch("TWILIO_ACCOUNT_SID")
  AUTH_TOKEN = ENV.fetch("TWILIO_AUTH_TOKEN")
  TWILIO_NUMBER = ENV.fetch("TWILIO_NUMBER")

  def self.call(message:, to:)
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)

    @client.calls.create(
      from: TWILIO_NUMBER,
      to: to,
      twiml: "<Response><Say>#{message}</Say></Response>",
    )

    @client.messages.create(
      :from => TWILIO_NUMBER,
      :to => to,
      :body => message,
    )
  end
end