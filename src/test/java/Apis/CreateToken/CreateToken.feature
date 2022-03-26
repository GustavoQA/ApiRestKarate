
  Feature: API booking
    
    Background:
      * url url
      * header Accept = 'application/json'
      * header Content-Type = 'application/json'

      Scenario: create booking

        * def body =

        """
{
    "firstname" : "Jim",
    "lastname" : "Brown",
    "totalprice" : 111,
    "depositpaid" : true,
    "bookingdates" : {
        "checkin" : "2018-01-01",
        "checkout" : "2019-01-01"
    },
    "additionalneeds" : "Breakfast"
}
        """
        Given path 'booking'
        And request body
        When method get
        Then status 200
