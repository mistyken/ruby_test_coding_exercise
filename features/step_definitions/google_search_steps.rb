require 'selenium-cucumber'
require_relative '../page_objects/google_search_page'
require_relative '../page_objects/google_search_result_page'

Given('I can navigate to {string} search page') do |string|
  navigate_to("https://www.#{string}.com")
  wait_for_element_to_display('xpath', GoogleSearchPage::SEARCH_FIELD, 5)
end

When('I enter {string} into the search bar') do |string|
  enter_text('xpath', string, GoogleSearchPage::SEARCH_FIELD)
end

When('I click the search button') do
  wait_for_element_to_enable('xpath', GoogleSearchPage::SEARCH_BUTTON, 5)
  click('xpath', GoogleSearchPage::SEARCH_BUTTON)
end

Then('I should see title of page containing {string} and show more than one search result') do |string|
  check_partial_title(string, true)
  wait_for_element_to_display('xpath', GoogleSearchResultPage::RESULT_STATS, 5)
  search_result = get_element_text('xpath', GoogleSearchResultPage::RESULT_STATS).split[1].gsub(',', '')
  raise 'no result returned' if search_result.to_i < 1
end

Then('I should see information related to {string} in headlines') do |string|
  search_headlines = $driver.find_elements(:xpath => GoogleSearchResultPage::RESULT_HEADLINES)
  search_headlines.each do |i|
    unless i.text.blank?
      raise "#{string} not in search headline #{i.text}" unless i.text.upcase.include? string.upcase
    end
  end
end