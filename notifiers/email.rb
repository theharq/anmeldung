require "pony"

class Email
  def self.call(message:, to:)
    Pony.mail({
      from: "noreply@example.com",
      to: to,
      subject: "[Anmeldung] - available dates",
      body: message,
      via: :smtp,
      via_options: {
        address: "smtp.mailgun.org",
        port: "587",
        enable_starttls_auto: true,
        user_name: ENV.fetch("MAILGUN_SMTP_LOGIN"),
        password: ENV.fetch("MAILGUN_SMTP_PASSWORD"),
        authentication: :plain,
        domain: "heroku.com"
      }
    })
  end
end