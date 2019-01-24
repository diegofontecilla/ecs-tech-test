require 'selenium-webdriver'
require_relative 'table_rows_processor'

class AutomatedTests

  attr_reader :table_rows_processor

  def initialize(table_rows_processor = TableRowsProcessor.new)
    @table_rows_processor = table_rows_processor
  end

  def test
    driver = Selenium::WebDriver.for :chrome
    wait = Selenium::WebDriver::Wait.new(:timeout => 9)

    driver.get "http://localhost:3000/"

    # locate span inside button
    render_challenge_button = driver.find_element(:xpath, '//*[@id="home"]/div/div/button/div/div/span')

    sleep 1

    # click button
    render_challenge_button.click
    wait.until { driver.find_element(:xpath, '//*[@id="challenge"]/div/div/h1') }

    # select table rows
    table_rows = driver.find_elements(:xpath, '//*[@id="challenge"]/div/div/div[1]/div/div[2]/table/tbody/tr')

    xpath_start = '//*[@id="challenge"]/div/div/div[2]/div/div[1]/'
    xpath_tail = '/input[@type="text"]'
    div = ['div[1]', 'div[2]', 'div[3]']
    i = 0

    # find first, second and third text box
    get_indexes(table_rows).each do |index|
      driver.find_element(:xpath, xpath_start + div[i] + xpath_tail).send_keys(index)
      sleep 1
      i += 1
    end

    # type name in fourth text box
    driver.find_element(:xpath, xpath_start + 'div[4]' + xpath_tail).send_keys('Diego Fontecilla')

    # click submit button
    driver.find_element(:xpath, '//span[contains(text(), "Submit Answers")]').click
    wait.until { driver.find_element(:xpath, '//div[contains(text(),"✅")]') }
    driver.find_element(:xpath, '//span[contains(text(),"Close")]').click
    sleep 2
    driver.find_element(:xpath, '//span[contains(text(), "Submit Answers")]').click

    sleep 2
  end

  private

  def get_indexes(table_rows)
    table_rows_processor.process_table_row(table_rows)
  end

end

automated_tests = AutomatedTests.new
automated_tests.test
