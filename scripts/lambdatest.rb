require 'yaml'
require 'rspec'
require 'appium_lib'

TASK_ID = (ENV['TASK_ID'] || 0).to_i
CONFIG_NAME = ENV['CONFIG_NAME'] || 'single'

CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__), "../config/#{CONFIG_NAME}.config.yml")))
CONFIG['user'] = ENV['LT_USERNAME'] || CONFIG['user']
CONFIG['key'] = ENV['LT_ACCESS_KEY'] || CONFIG['key']

RSpec.configure do |config|
  config.around(:example) do |example|
    @caps = CONFIG['common_caps'].merge(CONFIG['browser_caps'][TASK_ID])
    @caps["name"] = ENV['name'] || example.metadata[:name] || example.metadata[:file_path].split('/').last.split('.').first

    puts @caps.inspect

    caps = {
      "LT:Options" => {
        "build" => @caps["build"],
        "name" => @caps["name"],
        "platformName" => @caps["platform"],
        "isRealMobile" => @caps["isRealMobile"],
        "deviceName" => @caps["deviceName"],
        "platformVersion" => @caps["platformVersion"],
        "app" => @caps["app"],
        "w3c" => true,
        "visual" => @caps["visual"],
        "network" => @caps["network"],
        "console" => @caps["console"]
      }
    }

    server_url = "https://#{CONFIG['user']}:#{CONFIG['key']}@#{CONFIG['server']}/wd/hub"
    
    appium_driver = Appium::Driver.new({
      caps: caps,
      appium_lib: {
        server_url: server_url,
        wait_timeout: 30,
        wait_interval: 0.5
      }
    }, false)

    @driver = appium_driver.start_driver
    begin
      example.run
    ensure
      @driver.quit
    end
  end
end
