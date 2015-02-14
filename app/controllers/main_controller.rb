class MainController < ApplicationController
  def index
    browser = $phantom
    begin
      browser.goto params[:url]
    rescue Selenium::WebDriver::Error::WebDriverError,Errno::ECONNREFUSED
      browser = Watir::Browser.new :phantomjs
      $phantom = browser
      browser.goto params[:url]
    end
    render :text=> browser.html
  end
end
