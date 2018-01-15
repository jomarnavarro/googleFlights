#Author: jomarnavarro@gmail.com
#
# Test case:
# Creates invalid google flights by changing certain params.

@google_flights @invalid @IATA
Feature: Google flight invalid param search using IATA codes

  Scenario Outline: User attempts to create round trip with invalid destination - IATA code
    Given Dummy Step
    When Dummy Step
    Then Dummy Step

    Examples:
      | flight_type | origin      | destination | departure_date | return_date |
      | Economy     | Guadalajara | AXY         | Feb 12         | Feb 26      |
