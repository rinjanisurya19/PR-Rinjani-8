Feature: Other feature that use bearer token

  Background:
    * def tokenResponse = karate.callSingle('classpath:examples/tests/store-token.feature')
    * def bearerToken = tokenResponse.bearerToken

  Scenario:
    Given url 'https://task-manager-farah-8490b8468a02.herokuapp.com/api/tasks'
    And header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + bearerToken
    And request {"title": "Sample task2","description": "this is simple task","owner": "Test"}
    When method POST
    Then status 201
    And print response