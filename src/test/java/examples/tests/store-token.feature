Feature: Store token

  Scenario: Store OAuth token
    * def accessToken = karate.get('accessToken')
    * karate.set('bearerToken', accessToken)
