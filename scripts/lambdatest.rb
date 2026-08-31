require 'appium_lib'
require 'rspec'

RSpec.configure do |config|
  config.before(:each) do
    username = ENV['LT_USERNAME']
    accessToken = ENV['LT_ACCESS_KEY']

    caps = {
      "platformName" => "Android",
      "appium:deviceName" => "Galaxy S24",
      "appium:platformVersion" => "14",
      "appium:app" => "lt://proverbial-android",
      "appium:isRealMobile" => true,
      "appium:automationName" => "UiAutomator2",
      "lt:options" => {
        "user" => username,
        "accessKey" => accessToken,
        "build" => "RSpec-Android-Build",
        "name" => "RSpec Sample Test",
        "w3c" => true
      }
    }

    appium_lib_options = {
      server_url: "https://#{username}:#{accessToken}@mobile-hub.lambdatest.com/wd/hub"
    }

    @appium_driver = Appium::Driver.new({ caps: caps, appium_lib: appium_lib_options }, true)
    @driver = @appium_driver.start_driver
  end

  config.after(:each) do
    @driver.quit if @driver
  end
end