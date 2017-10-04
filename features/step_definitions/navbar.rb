Then(/^I should be logged in$/) do
  expect(navbar_page.logged_email).to eq(@email)
end

When(/^I click the login button$/) do
  navbar_page.visit_login
end

Then(/^I click the logout button$/) do
  navbar_page.visit_logout
end
