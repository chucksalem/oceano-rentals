# frozen_string_literal: true

Given(/^I am on the maps page$/) do
  visit maps_page_path
end

Then(/^I should see the overview and details$/) do
  expect(page).to have_content('Overview')
  expect(page).to have_xpath("//img[@src='/files/maps/oceano_map_overview.jpg']")
  expect(page).to have_xpath("//img[@src='/files/maps/oceano_map_detail.jpg']")
end
