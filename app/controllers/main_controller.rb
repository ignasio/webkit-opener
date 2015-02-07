class MainController < ApplicationController
  def index
    browser = $firefox
    begin
      browser.goto params[:url]
    rescue Selenium::WebDriver::Error::WebDriverError,Errno::ECONNREFUSED
      browser = Watir::Browser.new :firefox
      $firefox = browser
      browser.goto params[:url]
    end
    render :text=> browser.html
  end
end
