Given('user already on the homepage') do
  Capybara.page.current_window.maximize
  visit 'https://automationexercise.com/'
end

When('user click button sign in') do
  find(:xpath, "//a[@href='/login']").click
  expect(URI.parse(current_url)).to have_content("/login")
end

When('user input credentials') do
  find(:xpath, "//input[@data-qa='login-email']").set("muhammadgani25.75@gmail.com")
  fill_in 'password', with: 'gemini25'
  click_on 'Login'
end

Then('user success logged in') do
  find(:xpath, "//*[text()='gani']").should be_visible
end
