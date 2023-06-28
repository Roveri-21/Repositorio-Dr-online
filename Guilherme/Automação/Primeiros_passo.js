describe('template spec', () => { //descrever o que vou testar/
    it('passes', () => { //executavel da automação
      cy.visit('https://homol.pssaude.com.br:4000/#') // visita no site 
      cy.get(':nth-child(1) > .mx-auto > .input-group > .form-control').type('teste').should('have') // ta reconhecendo o campo de escrever o login e 
    })
  })

// Visita uma página específica
cy.visit('https://www.example.com')

// Localiza um elemento com base no seletor CSS e interage com ele
cy.get('.my-class').click()

// Insere um texto em um campo de entrada
cy.get('#my-input').type('Texto de exemplo')

// Verifica se um elemento contém um texto específico
cy.get('.my-element').should('contain', 'Texto esperado')

// Verifica se um elemento é visível na página
cy.get('.my-element').should('be.visible')

// Verifica se um elemento está habilitado para interação
cy.get('.my-element').should('be.enabled')

// Espera um determinado período de tempo em milissegundos
cy.wait(1000)

// Executa uma ação no teclado, como pressionar Enter
cy.get('.my-element').type('{enter}')

// Executa uma ação no teclado, como pressionar a tecla Tab
cy.get('.my-element').type('{tab}')

// Clica com o botão direito do mouse em um elemento
cy.get('.my-element').rightclick()

// Simula uma rolagem para cima ou para baixo na página
cy.get('body').scrollTo('bottom')

// Gera um número aleatório entre um valor mínimo e máximo
cy.randomNumber({ min: 1, max: 100 })

// Executa uma asserção personalizada usando uma função de callback
cy.get('.my-element').should(($el) => {
  expect($el).to.have.css('color', 'red')
})

// Faz uma chamada de API e realiza asserções nos dados retornados
cy.request('GET', '/api/data').then((response) => {
  expect(response.status).to.equal(200)
  expect(response.body).to.have.property('data')
})

// Verifica se um elemento contém um atributo específico
cy.get('.my-element').should('have.attr', 'data-testid', 'my-id')

// Limpa o valor de um campo de entrada
cy.get('#my-input').clear()

// Executa uma asserção em um elemento usando uma expressão regular
cy.get('.my-element').should('match', /Expressão regular/)

// Realiza uma ação de arrastar e soltar elementos
cy.get('.draggable').drag('.droppable')

// Foca em um elemento específico
cy.get('#my-input').focus()

// Pausa a execução do teste para fins de depuração
cy.pause()

// Executa um clique duplo em um elemento
cy.get('.my-element').dblclick()

// Verifica se um elemento tem uma determinada classe CSS
cy.get('.my-element').should('have.class', 'my-class')

// Emula o hover (passar o mouse) em um elemento
cy.get('.my-element').trigger('mouseover')

// Espera até que um elemento não seja mais visível
cy.get('.my-element').should('not.be.visible')

// Verifica se um elemento está desabilitado para interação
cy.get('.my-element').should('be.disabled')

// Emula a pressão de uma tecla específica do teclado
cy.get('.my-element').type('{keydown}', { keyCode: 13 })

// Clica em um elemento usando coordenadas específicas
cy.get('.my-element').click(50, 50)
