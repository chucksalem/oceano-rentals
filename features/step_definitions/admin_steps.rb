# frozen_string_literal: true

module AuthHelper
  def http_auth
    encoded_login = ["#{Rails.application.credentials.admin[:username]}:#{Rails.application.credentials.admin[:password]}"].pack("m*")
    page.driver.header 'Authorization', "Basic #{encoded_login}"
  end
end

World(AuthHelper)

Before do
  http_auth
end

Given(/^I am on the admin home page$/) do
  visit admin_root_path
end

Then(/^I should see 'Admin Panel'$/) do
  expect(page).to have_content('Admin Panel')
end
