#Author: jomarnavarro@gmail.com
#
# Test case:
# Creates valid google flights by changing certain params.

@google_flights @invalid
Feature: Google flight valid param search using City Name

  Scenario Outline: User creates valid round trip flight - best flight
    Given Dummy Step
    When Dummy Step
    Then Dummy Step

    Examples:
      | flight_type | origin      | destination | departure_date | return_date |
      | Economy     | Guadalajara | Mexico City | Feb 12         | Feb 26      |
