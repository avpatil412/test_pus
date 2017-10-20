require 'Selenium-WebDriver'
require 'watir'
require 'watir-webdriver'


begin
  driver = Selenium::WebDriver.for :joinme
  #driver = Selenium::WebDriver::JoinMe::Profile.new
 # driver.assume_untrusted_certificate_issuer = true
  #driver.secure_ssl =  true
  driver.open()
rescue Selenium::WebDriver::Error => e
  puts "watir webdriver instantiation failed with #{e} "
end
