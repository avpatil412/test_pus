require 'Selenium-WebDriver'
require 'watir'
require 'watir-webdriver'


begin
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile.assume_untrusted_certificate_issuer = true
  profile.secure_ssl =  true
  capabilities= Selenium::WebDriver::Remote::Capabilities.firefox({:accept_insecure_certs=> true})
  @browser = Watir::Browser.new :chrome
  @browser.window.maximize
  @browser.goto "https://ui-staging.horizon.pitneycloud.com"
  puts "*** The browser title is => #{@browser.title} **** \n"
  sleep(6)
  @browser.text_field(:id => "username").send_keys("UIMulti1PP1@mailinator.com")
  @browser.text_field(:id => "password").send_keys("PB123456")
  @browser.button(:id => "signinButton").click
  sleep(6)
  @browser.button(:id => "home-carrier-selector-usps").click
  sleep(6)
  @browser.element(:css => "#addressBlock-country > div.selectize-input.form-control").click
  #sleep(5)
  countries = Array.new
  selectList = @browser.elements(:css => "div[class='option ui-select-choices-row-inner'] div[data-ng-bind-html='country.name | highlight: $select.search']")
  selectList.each do |li|
    countries.push(li.text)
  end
  puts "****", countries.count
  puts countries
  mc = ["India","Cuba","Badas"]
  mc.each do |x|
    if countries.include?x
      puts "#{x},pass^^^"
    else
      puts "#{x},$$$$fails"
    end
  end
  @browser.close
  @browser.quit
rescue Exception => e
  puts "watir webdriver instantiation failed with #{e}"
  @browser.close
  @browser.quit
end
