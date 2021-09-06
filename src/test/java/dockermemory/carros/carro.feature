Feature: Testando API de carros

Background:
  * url 'http://localhost:8080/carro'

Scenario: Buscar todas os carros
  Given path '/todos'
  And param size = 2
  When method get
  Then status 200

Scenario: Criar novo carro
  * def carro =
  """
    {
      "nome": "Novo Carro",
      "cor": "AZUL",
      "ano": 2016,
      "dono": 7
    }
  """
  
  Given request carro
  When method post
  Then status 200
  Then match response.nome == carro.nome
  Then match response.cor == carro.cor
  Then match response.ano == carro.ano
  * print 'ID do novo carro: ', response.id

  Given params { id: #(response.id) }
  When method get
  Then status 200
  Then match response[0].nome == carro.nome
  Then match response[0].cor == carro.cor
  Then match response[0].ano == carro.ano
  Then match response[0].dono.id == carro.dono


