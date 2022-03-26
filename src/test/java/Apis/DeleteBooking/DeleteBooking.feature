
  Feature: API booking
    
    Background:
      * url url

      Scenario: obtener todos los libros
        Given path 'booking'
        When method get
        Then status 200
        * def count = response.length
        * print 'Numero de Registro ------>', count
        And match count == 10