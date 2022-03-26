Feature: API booking (Reservas de hospedajes)

  Background:
    # URL (SE DEFINE EL BASE PATH URI)
    * url url
    # HEADER (SE DEFINE LAS CONFIGURACIONES DE LAS CABECERAS,Y OTROS ATRIBUTOS)
    * header Accept = 'application/json'

  Scenario: obtener todos los Booking
    # path (es el recurso o camino a que modulo consultar)
    Given path 'booking'
    # method (el metodo con cual se requiere realizar)
    When method Get
    # status (valida el estado de respuesta)
    Then status 200
    # validaciones (aqui guardamos en variables los datos para luego validarlo)
    * def count = response.length
    * print 'Numero de Registro es : ',count
    # match (aqui se validan)
    And match count == 31

  Scenario: Obtener los detalles de la reserva de un cliente
    * def id = 1

    Given path 'booking',id
    When method get
    Then status 200
    * print 'El Nombre del cliente para el id N°' ,id ,'es :' ,response.firstname
    * print 'El Precio de la reserva para el id N°' ,id ,'es :' ,response.totalprice

    And match $.firstname == 'Mary'
    And match $.totalprice == 316

  Scenario Outline: Obtener los detalles de la reserva del cliente N° <test> con DataTable

    Given path 'booking',<id>
    When method get
    Then status 200

    Examples:
      | test | id |
      | 1    | 1  |
      | 2    | 2  |
      | 3    | 3  |

  Scenario Outline: Get details booking with csv <test>

    Given path 'booking',<id>
    When method get
    Then status 200

    Examples:

      | read('DataGetBooking.csv') |

