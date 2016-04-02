#Selenium::WebDriver::Firefox::Binary.path = "/Applications/FirefoxDeveloperEdition.app/Contents/MacOS/firefox-bin"


require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end