Feature: Get User Hash and Uname

  Background:
    * url 'https://api.spoonacular.com/'
    * def apiKey = '1065eecace0f45d9abfa481db565817b'

  Scenario: Get username and hash from connect user
    Given path 'users/connect'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And request {"username": "frfusch21New","firstName": "Farah","lastName": "Yulianti","email": "reviewfarmei20@gmail.com"}
    When method post
    Then status 200
    And print response