# frozen_string_literal: true

Given(/^I am on the resources page$/) do
  visit resources_page_path
end

Then(/^I should see 'Resources'$/) do
  expect(page).to have_content('Resources')
end

And(/^Helpful links to other pages$/) do
  expect(page).to have_content('The Essentials')
  expect(page)
    .to have_link('Get Home Insurance >', href: 'https://sb.iigins.com/mexico-home-owners/quick-quote/quote_step_1.mhtml?aff_id=3732')
  expect(page)
    .to have_link('Get Car Insurance >', href: 'https://sb.iigins.com/quote/?aff_id=3732&agtdst=DEKACF&office_code=;')
  expect(page)
    .to have_link('View Forecast >', href: 'http://www.tide-forecast.com/locations/Puerto-Penasco-Sonora-Mexico/tides/latest')
  expect(page)
    .to have_link('Compare Properties >', href: '/properties')
end
