require 'capybara'
require 'capybara/cucumber'
require 'cucumber'
require 'dotenv'
require 'rspec'
require 'site_prism'
require 'webdrivers'

Dotenv.load
Dotenv.overload(".env.#{ENV['ENV']}")

@tags = Array.new
browser = (ENV['BROWSER'] || 'chrome').to_sym
wait_time = 60 * 5

puts "Browser   : #{browser.upcase}"
puts "Headless  : #{ENV["HEADLESS"].upcase}"
puts "Private   : #{ENV["PRIVATE"].upcase}"

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  if ENV['HEADLESS'].downcase == 'yes'
    options.add_argument('--headless')
  end
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--disable-notifications')
  options.add_argument('--window-size=1366,1000')
  options.add_argument('--disable-blink-features=BlockCredentialedSubresources')
  options.add_argument('--disable-blink-features=AutomationControlled')
  if ENV["PRIVATE"].downcase =='yes'
    options.add_argument('--headless')
  end
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.open_timeout = wait_time
  client.read_timeout = wait_time

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    timeout: 30,
    options: options,
    http_client: client
  )
end

Capybara.register_driver :firefox do |app|
  # profile = Selenium::WebDriver::Firefox::Profile.new
  options = Selenium::WebDriver::Firefox::Options.new
  if ENV['HEADLESS'].downcase == 'yes'
    options.add_argument('--headless')
  end
  options.add_preference 'dom.webdriver.enabled', false
  options.add_preference 'dom.webnotifications.enabled', false
  options.add_preference 'dom.push.enabled', false
  options.add_argument('--width=1366')
  options.add_argument('--height=1000')
  if ENV["PRIVATE"].downcase =='yes'
    options.add_argument('-private')
  end
  # options.profile = profile
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.open_timeout = wait_time
  client.read_timeout = wait_time
  Capybara::Selenium::Driver.new(
    app,
    browser: :firefox,
    options: options,
    http_client: client,
  )
end

Capybara.configure do |config|
  config.default_driver = browser
  config.default_max_wait_time = 30
end

def loadBrowser
  if ENV['BROWSER'].downcase=="safari"
      browser = (ENV['BROWSER']).to_sym
  else
    if @tags.include? "@mweb"
      browser = (ENV['BROWSER']+'_mweb' || 'chrome').to_sym
    else
      browser = (ENV['BROWSER'] || 'chrome').to_sym
    end
  end
  Capybara.current_driver = browser
end


