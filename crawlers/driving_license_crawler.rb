require "capybara/dsl"
require "capybara/apparition"

Capybara.run_server = false
Capybara.current_driver = :apparition
Capybara.app_host = "https://service.berlin.de/dienstleistung/327537/"
Capybara.default_max_wait_time = 15

class DrivingLicenseCrawler
  include Capybara::DSL

  # To get these ids go to https://service.berlin.de/dienstleistung/327537/ and pick your district
  BURGERAMT_IDS = ENV.fetch("BURGERAMT_IDS")
  URL = "https://service.berlin.de/terminvereinbarung/termin/tag.php?termin=1&anliegen[]=327537&dienstleisterlist=#{BURGERAMT_IDS}"

  def initialize
    visit(URL)
  end

  def available_dates
    all("td.buchbar a").map(&:text).map(&:to_i)
  end
end
