require_relative '../pages/base_page'

class LoginPageDesktop < SitePrism::Page
  include BasePage

  element :btnLogin, :xpath, "//a[@href='/login']"
  element :fieldUserName, :xpath, "//input[@data-qa='login-email']"
  element :fieldPassword, :xpath, "//input[@data-qa='login-password']"
  element :btnLoginSubmit, :xpath, "//button[@data-qa='login-button']"

  def clickBtnLogin
    btnLogin.click
  end

  def inputCredentials
    fieldUserName.set("muhammadgani25.75@gmail.com")
    fieldPassword.set("gemini25")
  end

  def clickBtnLoginAtLoginPage
    btnLoginSubmit.click
  end

  def validateSuccessLogin
    find(:xpath, "//*[text()='gani']").should be_visible
  end

end
