require "selenium-webdriver"

# @driver = Selenium::WebDriver.for :remote, :url => "http://127.0.0.1:4444/wd/hub", :desired_capabilities => :chrome
@driver = Selenium::WebDriver.for :chrome

@driver.navigate.to "https://knowledge.sakura.ad.jp/" 

sleep(10) 

puts @driver.title

@driver.find_elements(:css, "h2 a").first.click

sleep(10) 

puts @driver.current_url

@driver.save_screenshot('./chrome.png')

@driver.quit