Feature: API booking

  Background:
    * url url
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

  Scenario: Create booking
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
    When method post
    Then status 200
    And match response.booking.firstname contains 'Jim'
    And match response.booking.lastname contains 'Brown'
    And match response.booking.totalprice contains 111
    And match response.booking.depositpaid contains true
    And match response.booking.bookingdates.checkin contains '2018-01-01'
    And match response.booking.bookingdates.checkout contains '2019-01-01'
    And match response.booking.additionalneeds contains 'Breakfast'

  Scenario Outline: Create booking with datatable <test>
    * def body =
      """
      {
          "firstname" : "<firstname>",
          "lastname" : "<lastname>",
          "totalprice" : <totalprice>,
          "depositpaid" : <depositpaid>,
          "bookingdates" : {
              "checkin" : "<checkin>",
              "checkout" : "<checkout>"
          },
          "additionalneeds" : "<additionalneeds>"
      }
      """
    Given path 'booking'
    And request body
    When method post
    Then status 200
    And match response.booking.firstname contains '<firstname>'
    And match response.booking.lastname contains '<lastname>'
    And match response.booking.totalprice contains <totalprice>
    And match response.booking.depositpaid contains <depositpaid>
    And match response.booking.bookingdates.checkin contains '<checkin>'
    And match response.booking.bookingdates.checkout contains '<checkout>'
    And match response.booking.additionalneeds contains '<additionalneeds>'

    Examples:
      | test   | firstname | lastname | totalprice | depositpaid | checkin    | checkout   | additionalneeds |
      | tc-001 | Alexander | Avila    | 120        | true        | 2021-12-01 | 2022-01-31 | prueba 1        |
      | tc-002 | Arturo    | Avila    | 123        | true        | 2021-12-01 | 2022-01-31 | prueba 2        |
      | tc-003 | Santiago  | Avila    | 130        | false       | 2021-12-01 | 2022-01-31 | prueba 3        |

  Scenario Outline: Create booking with json
    * def data = read('classpath:src/test/java/Apis/CreateBooking/data1.json')
    * def body =
      """
      {
          "firstname" : "#(firstname)",
          "lastname" : "#(lastname)",
          "totalprice" : #(totalprice),
          "depositpaid" : #(depositpaid),
          "bookingdates" : {
              "checkin" : "#(bookingdates.checkin)",
              "checkout" : "#(bookingdates.checkout)"
          },
          "additionalneeds" : "#(additionalneeds)"
      }

      """
    Given path 'booking'
    And request body
    When method post
    Then status 200
    And match response.booking.firstname contains firstname
    And match response.booking.lastname contains lastname
    And match response.booking.totalprice contains totalprice
    And match response.booking.depositpaid contains depositpaid
    And match response.booking.bookingdates.checkin contains bookingdates.checkin
    And match response.booking.bookingdates.checkout contains bookingdates.checkout
    And match response.booking.additionalneeds contains additionalneeds

    Examples:
   |read('data1.json')|

  Scenario: Create booking with schema json
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
    When method post
    Then status 200
    And match response.booking.firstname contains 'Jim'
    And match response.booking.lastname contains 'Brown'
    And match response.booking.totalprice contains 111
    And match response.booking.depositpaid contains true
    And match response.booking.bookingdates.checkin contains '2018-01-01'
    And match response.booking.bookingdates.checkout contains '2019-01-01'
    And match response.booking.additionalneeds contains 'Breakfast'