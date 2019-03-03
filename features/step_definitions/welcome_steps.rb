Given(/^I am on the home page$/) do
  visit root_path
end

Then(/^I should see "Welcome to Océano Rentals"/) do
  expect(page).to have_content("Welcome to Océano Rentals")
end
