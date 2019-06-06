require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'yaml'
require 'browserstack/local'

if ENV['chrome']
 Capybara.default_driver = :chrome
 Capybara.register_driver :chrome do |app|
 options = {
 :js_errors => false,
 :timeout => 360,
 :debug => false,
 :inspector => false,
 }
 Capybara::Selenium::Driver.new(app, :browser => :chrome)
 end
elsif ENV['firefox']
 Capybara.default_driver = :firefox
 Capybara.register_driver :firefox do |app|
 options = {
 :js_errors => true,
 :timeout => 360,
 :debug => false,
 :inspector => false,
}
 Capybara::Selenium::Driver.new(app, :browser => :firefox)
 end
elsif
 class Capybara::Selenium::Driver < Capybara::Driver::Base
  def reset!
    if @browser
      @browser.navigate.to('about:blank')
    end
  end
end

TASK_ID = (ENV['TASK_ID'] || 0).to_i
CONFIG_NAME = ENV['CONFIG_NAME'] || 'single'

CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../../config/config.yml")))
CONFIG['user'] = ENV['BROWSERSTACK_USERNAME'] || CONFIG['user']
CONFIG['key'] = ENV['BROWSERSTACK_ACCESS_KEY'] || CONFIG['key']

Capybara.register_driver :browserstack do |app|
  @caps = CONFIG['common_caps'].merge(CONFIG['browser_caps'][TASK_ID])

  # Code to start browserstack local before start of test
  if @caps['browserstack.local'] && @caps['browserstack.local'].to_s == 'true';
    @bs_local = BrowserStack::Local.new
    bs_local_args = {"key" => "#{CONFIG['key']}"}
    @bs_local.start(bs_local_args)
  end

Capybara::Selenium::Driver.new(app,
    :browser => :remote,
    :url => "http://#{CONFIG['user']}:#{CONFIG['key']}@#{CONFIG['server']}/wd/hub",
    :desired_capabilities => @caps
  )
end

Capybara.default_driver = :browserstack

# Code to stop browserstack local after end of test
 at_exit do
  @bs_local.stop unless @bs_local.nil?
 end
end
