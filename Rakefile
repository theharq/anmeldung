# require './crawlers/anmeldung_crawler'
require './crawlers/driving_license_crawler'
require './notifiers/email'
require './notifiers/phone'

desc "This task is called by the Heroku scheduler add-on"
task :check_anmeldung do
  puts "Getting all available dates..."
  dates = DrivingLicenseCrawler.new.available_dates

  if dates.any?
    message = "Dates: #{dates}, click here: #{DrivingLicenseCrawler::URL}"
    Email.call(message: message, to: ENV.fetch("MY_EMAIL"))
    Phone.call(message: message, to: ENV.fetch("MY_PHONE"))
  end
end
