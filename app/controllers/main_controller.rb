class MainController < ApplicationController
  def index
    browser = $chrome
    begin
      browser.goto params[:url]
    rescue Selenium::WebDriver::Error::WebDriverError,Errno::ECONNREFUSED
      browser = Watir::Browser.new :chrome
      $chrome = browser
      browser.goto params[:url]
    end
    render :text=> browser.html
  end
end
