#Selenium::WebDriver::Firefox::Binary.path = "/Applications/FirefoxDeveloperEdition.app/Contents/MacOS/firefox-bin"

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end