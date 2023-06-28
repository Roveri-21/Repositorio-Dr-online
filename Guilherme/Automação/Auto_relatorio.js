describe('template spec', () => { //descrever o que vou testar/
    it('passes', () => { //executavel da automação
      cy.visit('https://homol.pssaude.com.br:4000/#') // visita no site 
      cy.wait(1000)
      //cy.get(':nth-child(1) > .mx-auto > .input-group > .form-control').type('teste').should('have')
      cy.get(':nth-child(1) > .mx-auto > .input-group > .form-control').type('Gcypress')
      cy.get(':nth-child(2) > .mx-auto > .input-group > .form-control').type('gX$#951X7RgX')
      cy.get('#btnEntrar').click()
      cy.wait(1000)
      cy.get('#search-function-ps').should('be.enabled')
      cy.get('#search-function-ps').type('Relatório')
      cy.wait(1000)
      cy.get('[style=""] > #form-543').click()
      cy.wait(1000)
      cy.get('#txt-localizar').type('124')
      cy.get('#btn-localizar').click()
      cy.wait(1000)
      cy.get('#idrelatorio-124').dblclick()
      cy.wait(1000)
      cy.get('#btn-action-detail > .btn').click()
      cy.get('#btn-action-options-detail > :nth-child(3)').click()
    })
  })
  
  
  //Gcypress
  //gX$#951X7RgX