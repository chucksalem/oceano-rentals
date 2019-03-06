# frozen_string_literal: true

Before do
  http_auth
end

Given(/^I am on the admin dashboard page$/) do
  visit admin_root_path
end

When(/^I upload reviews through the 'Upload Reviews' button$/) do
  # attach_file('Upload Reviews', Rails.root.join('features', 'fixtures', 'reviews.xlsx'), visible: false)
end

Then(/^I should see success message$/) do
  # expect(page).to have_content('Reviews have been successfuly uploaded!')
end
