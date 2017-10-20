require 'Selenium-WebDriver'
require 'watir'
#require 'watir-webdriver'

begin
 # caps = Selenium::WebDriver::Remote::Capabilities.new
 # caps[:browserName] = "firefox"
#  caps[:version] = "latest-1"
  #caps[:platform] = :MAC
#  caps[:name] = "Watir WebDriver Test"

  browser = Watir::Browser.new(
      #:remote,
      :chrome)
     # :url => "http://google.co.in")
     # :desired_capabilities => caps)

 browser.goto "http://www.google.com"
 # browser.text_field(:name => 'q').set 'TestingBot'
 # browser.button(:name => 'btnG').click

  puts "****", browser.title
  browser.quit
rescue Watir::Browser::Exception => e
  puts "watir webdriver instantiation failed with #{e} "
end
