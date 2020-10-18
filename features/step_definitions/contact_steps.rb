# frozen_string_literal: true

Given(/^I am on the contact page$/) do
  visit contact_page_path
end

Then(/^I should see 'Contact Us'$/) do
  expect(page).to have_content('Contact Us')
end

Then(/^I'm able to contact through the form$/) do
  fill_in 'firstname', with: Faker::Name.first_name
  fill_in 'lastname', with: Faker::Name.last_name
  fill_in 'email', with: Faker::Internet.email
  fill_in 'phone', with: Faker::PhoneNumber.cell_phone_with_country_code
  fill_in 'message', with: Faker::Lorem.sentence

  click_on 'Submit Form'

  expect(page).to have_content('Thank you for contacting us.')
end
