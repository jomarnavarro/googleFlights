#Author: jomarnavarro@gmail.com
#
# Test case:
# Go to google.com
# Search for "in all media"
# Click on the result for "inallmedia.com"
# Validate InAllMedia logo is present in the site

@google_search @in_all_media
Feature: In All Media google search

  Scenario Outline: A user google searches the In All Media keyword and is able to navigate to it
    Given User google searches "<keyword>"
    When User clicks on link leading to in all media url
    Then User will be on In all Media page with "<title>"
    And The In All Media Logo will be displayed

    Examples:
      | keyword      | title |
      | in all media | IAM   |
