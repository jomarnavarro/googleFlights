#Author: jomarnavarro@gmail.com
#
# Test case:
# Creates invalid google flights by changing certain params.

@google_flights @invalid
Feature: Google flight invalid param search using City Name

  Scenario Outline: User attempts to create round trip with invalid destination
    Given Dummy Step
    When Dummy Step
    Then Dummy Step

    Examples:
      | flight_type | origin      | destination   | departure_date | return_date |
      | Economy     | Guadalajara | San Casteabro | Feb 12         | Feb 26      |
