require './crawlers/anmeldung_crawler'
require './notifiers/email'
require './notifiers/phone'

desc "This task is called by the Heroku scheduler add-on"
task :check_anmeldung do
  puts "Getting all available dates..."
  dates = AnmeldungCrawler.new.available_dates

  if dates.any?
    message = "Dates: #{dates}"
    Email.call(message: message, to: ENV.fetch("MY_EMAIL"))
    Phone.call(message: message, to: ENV.fetch("MY_PHONE"))
  end
end
