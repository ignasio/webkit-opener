class MainController < ApplicationController
  def index
    position = rand(2)
    browser_variable_name = $br_arr_keyword[position]
    browser = $br_arr[position]
    p browser_variable_name
    begin
      browser.goto params[:url]
    rescue Selenium::WebDriver::Error::WebDriverError,Errno::ECONNREFUSED
      browser = Watir::Browser.new browser_variable_name.to_sym  
      $br_arr[position] = browser
      browser.goto params[:url]
    end
    render :text=> browser.html
  end
end
