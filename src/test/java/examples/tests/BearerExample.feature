Feature: Get OAuth Token

  Background:
    * def clientID = 'client-id'
    * def clientSecret = 'clientSecret'
    # Endpoint untuk client tembak clientID dan clientSecret
#    * def tokenUrl = 'https://server-endpoint.com/oauth/token'\

    #This is a test of my API for Proof of Concept
    * def tokenUrl = 'https://task-manager-farah-8490b8468a02.herokuapp.com/api/login-form'

  Scenario: Get OAuth Token using client credentials
    Given url tokenUrl
#    And request {grant_type: 'client_credentials', client_id: clientID, client_secret: clientSecret}
    And request { "email": "test@gmail.com", "password": "12345678" }
    And header Content-Type = 'application/json'
    When method POST
    Then status 200
    * def access_token = response.access_token

  #Store token globally
* karate.callSingle('classpath:examples/tests/store-token.feature', { accessToken: access_token })
