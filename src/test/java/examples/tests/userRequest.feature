Feature: User API Tests

  Background:
    Given url "https://petstore.swagger.io/"
    And print "--try open petstore API--"

  Scenario: Login
    When url "https://petstore.swagger.io/v2/user/login"
    And method get
    And request {"username": "sdwreadd", "password": "random"}
    Then print response
    And status 200

  Scenario: Create User
    * def reqBody = { 'id': '0', 'username': 'sdwreadd', 'firstName': 'John', 'lastName': 'Doe', 'email': 'john.doe@example.com', 'password': 'password123', 'phone': '1234567890', 'userStatus': 1 }
    When url "https://petstore.swagger.io/v2/user"
    And request reqBody
    And method post
    Then print response
    And status 200

  Scenario: Get User by Username
    When url "https://petstore.swagger.io/v2/user/sdwreadd"
    And method get
    Then print response
    And status 200

  Scenario: Update User
    * def reqBody = { 'id': '0', 'username': 'sdwreadd', 'firstName': 'John', 'lastName': 'DoeUpdated', 'email': 'john.updated@example.com', 'password': 'newpassword123', 'phone': '0987654321', 'userStatus': 1 }
    When url "https://petstore.swagger.io/v2/user/sdwreadd"
    And request reqBody
    And method put
    Then print response
    And status 200

  Scenario: Delete User
    * def reqHeader = { 'Content-Type': 'application/json' }
    When url "https://petstore.swagger.io/v2/user/sdwreadd"
    And method delete
    Then print response
    And status 200

  Scenario: Logout User
    When url "https://petstore.swagger.io/v2/user/logout"
    And method get
    Then print response
    And status 200
