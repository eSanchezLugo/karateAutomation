Feature: Articles

    Background: Definir url
        Given url 'https://api.realworld.io/api/'
        * def tokenResponse = callonce read('classpath:helpers/createToken.feature'){"email": "edsanchez91@gmail.com", "password": "Qa23prueba"}
        * def token = tokenResponse.authToken


    Scenario: Create a new article
        
        Given header Authorization = 'Token ' + token
        Given path 'articles'
        And request {"article": {"tagList": [], "title": "prueba karate 3", "description": "prueba karate 3","body": "prueba karate 3"}}
        When method Post
        Then status 200
        And match response.article.title == 'prueba karate 3'
    
@debug
    Scenario: create and delete article
        
        Given header Authorization = 'Token ' + token
        Given path 'articles'
        And request {"article": {"tagList": [], "title": "prueba karate 4", "description": "prueba karate 4","body": "prueba karate 4"}}
        When method Post
        And match response.article.title == 'prueba karate 4'
        And print response
        * def articleId = response.article.slug
        And print articleId

        Given params {limit: 10, offser: 0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title == 'Create a new implementation'

        Given header Authorization = 'Token ' + token
        Given path 'articles',articleId
        When method Delete

        Given params {limit: 10, offser: 0}
        Given path 'articles'
        When method Get
        Then status 200
        And match response.articles[0].title != 'prueba karate 4'
