Given('user already on the homepage') do
  visit 'https://automationexercise.com/'
end

When('user click button sign in') do
  @page.login_page.clickBtnLogin
  expect(URI.parse(current_url)).to have_content("/login")
end

When('user input credentials') do
  @page.login_page.inputCredentials
end

When('user click button login at login page') do
  @page.login_page.clickBtnLoginAtLoginPage
end

Then('user success logged in') do
  @page.login_page.validateSuccessLogin
end
