Feature: A client requests an access token with the None Response Type

  Scenario: A client sends a authorization requests with the None Response Type and the Resource Owner accepts it.
    Given The user "john.1" is logged in and fully authenticated
    And A client sends a authorization requests with the None Response Type
    When the Resource Owner accepts the authorization request
    Then the client should be redirected
    And the redirection Uri starts with "https://example.com/redirection/callback?state=0123456789#_=_"
    And no access token creation event is thrown

  Scenario: A client sends a authorization requests with the None Response Type and the Resource Owner rejects it.
    Given The user "john.1" is logged in and fully authenticated
    And A client sends a authorization requests with the None Response Type
    When the Resource Owner rejects the authorization request
    Then the client should be redirected
    And the redirection Uri starts with "https://example.com/redirection/callback"
    And the redirection ends with "#_=_"
    And the redirect query should contain parameter "error" with value "access_denied"
    And the redirect query should contain parameter "error_description" with value "The resource owner denied access to your client."
    And no access token creation event is thrown
