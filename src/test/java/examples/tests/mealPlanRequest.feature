Feature: Test Get Meal Plan

  Background:
    * url 'https://api.spoonacular.com/'
    * def apiKey = '1065eecace0f45d9abfa481db565817b'
    * def hash = '9db382d4801cb203e8dd4527915c61f006cae4d2'
    * def username = 'frfusch21new'
    * def startDate = '2024-09-25'

  Scenario: Test Generate MealPlan
    Given path 'mealplanner/generate'
    And param apiKey = apiKey
    And param timeFrame = 'day'
    And param targetCalories = '1000'
    When method get
    Then status 200
    And print response

  Scenario: Adding items to meal plan
    Given path 'mealplanner', username, 'items'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request {"date": 1719500800,"slot": 1,"position": 0,"type": "INGREDIENTS","value": {"ingredients": [{"name": "1 banana"}]}}
    When method post
    Then status 200
    And match response.status == 'success'
    And print response

  Scenario: Adding items to Shopping List
    Given path 'mealplanner', username, 'shopping-list','items'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    And request [{"item": "1 package baking powder","aisle": "Baking","parse": true}]
    When method post
    Then status 200
    And print response

  Scenario: Get shopping list
    Given path 'mealplanner', username, 'shopping-list'
    And header Content-Type = 'application/json'
    And param apiKey = apiKey
    And param hash = hash
    When method get
    Then status 200
    And print response

