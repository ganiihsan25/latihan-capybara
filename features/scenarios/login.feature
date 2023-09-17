@login @desktop
Feature: Login page

@test1
Scenario: success login with correct credentials
    Given user already on the homepage
    When user click button sign in
    And user input credentials
    And user click button login at login page
    Then user success logged in

