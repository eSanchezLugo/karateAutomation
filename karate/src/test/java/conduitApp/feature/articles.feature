Feature: Articles

    Background: Definir url
        Given url 'https://api.realworld.io/api/'
        Given path 'users/login'
        And request {"user": {"email": "edsanchez91@gmail.com", "password": "Qa23prueba"}}
        When method Post
        Then status 200
        * def token = response.user.token
    
    Scenario: Create a new article

        Given header Authorization = 'Token ' + token
        Given path 'articles'
        And request {"article": {"tagList": [], "title": "prueba karate 6", "description": "prueba karate 6","body": "prueba karate 6"}}
        When method Post
        Then status 200
        And match response.article.title == 'prueba karate 6'
