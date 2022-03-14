
Feature: pruebas para la pagina de inicio

    Background: Definir url
        Given url 'https://api.realworld.io/api/'

    Scenario: obtener todos los tags
        
        Given path 'tags'
        When method Get
        Then status 200
        And match response.tags contains ['welcome', 'introduction']
        And match response.tags !contains 'truck'
        And match response.tags == '#array'
        And match each response.tags == '#string'
        

    Scenario: Obtener 10 articulos de la pagina
        Given params {limit: 10, offser: 0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles == '#[3]'
        And match response.articlesCount == 3