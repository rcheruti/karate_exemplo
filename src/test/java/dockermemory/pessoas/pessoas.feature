Feature: Testando API de pessoas

  Background:
    * url 'http://localhost:8080/pessoa'

  Scenario: Buscar todas as pessoas
    Given path '/todos'
    And param size = 2
    When method get
    Then status 200

  Scenario: Criar nova pessoa
    * def pessoa =
    """
      {
        "nome": "Nova Pessoa"
      }
    """
    
    Given request pessoa
    When method post
    Then status 200
    Then match response.nome == pessoa.nome
    * print 'ID da nova pessoa: ', response.id

    Given params { id: #(response.id) }
    When method get
    Then status 200
    Then match response[0].nome == pessoa.nome


