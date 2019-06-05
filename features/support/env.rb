require "capybara/cucumber"
require "selenium-webdriver"
require "site_prism"

#BrowserStack.for "cucumber"

#browser = Selenium::WebDriver.for :firefox

#Before do |scenario|
#  @browser = browser
#end

#Capybara.register_driver :chrome do
  # Capybara::Selenium::Driver.new(app, :browser => :chrome)
#end

#Before do
#  @driver = Selenium::WebDriver.for(:chrome)
#  Capybara.default_driver = :chrome
#  @driver.get('https://www.amazon.de/')
#end

Capybara.register_driver :chrome do |app|
   Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_driver = :chrome
#Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 20
Capybara.javascript_driver = :webkit
