@login
Feature: Login page

@test1
Scenario: success login with correct credentials
    Given user already on the homepage
    When user click button sign in
    And user input credentials
    Then user success logged in
    
