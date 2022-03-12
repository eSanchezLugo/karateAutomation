
Feature: pruebas para la pagina de inicio

    Scenario: obtener todos los tags
        Given url 'https://api.realworld.io/api/tags'
        When method Get
        Then status 200

    Scenario: Obtener 10 articulos de la pagina
        Given params {limit: 10, offser: 0}
        Given url 'https://conduit.productionready.io/api/articles'
        When method Get
        Then status 200