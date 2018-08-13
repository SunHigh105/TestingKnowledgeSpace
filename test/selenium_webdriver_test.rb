require "selenium-webdriver"

# @driver = Selenium::WebDriver.for :remote, :url => "http://127.0.0.1:9515/wd/hub", :desired_capabilities => :chrome
@driver = Selenium::WebDriver.for :chrome

@driver.get "http://localhost:3000/" 

sleep(5) 

puts @driver.title

@driver.find_elements(:xpath, '//ul[contains(@class, "navbar-right")]//a')[1].click

sleep(5)

email = @driver.find_element(:xpath, '//input[contains(@type, "email")]')

password = @driver.find_element(:xpath, '//input[contains(@type, "password")]')

email.send_keys('user_1@test.co.jp')

password.send_keys('password_1')

@driver.find_element(:xpath, '//input[contains(@type, "submit")]').click

puts @driver.current_url

@driver.quit