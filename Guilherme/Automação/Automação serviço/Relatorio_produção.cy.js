describe('template spec', () => { //descrever o que vou testar/
  it('passes', () => { //executavel da automação
    cy.visit('https://www.pssaude.com.br/#') // visita no site 
    cy.wait(1000)
    //cy.get(':nth-child(1) > .mx-auto > .input-group > .form-control').type('teste').should('have')
    cy.get(':nth-child(1) > .mx-auto > .input-group > .form-control').type('grsilva')
    cy.get(':nth-child(2) > .mx-auto > .input-group > .form-control').type('gui21@RS')
    cy.get('#btnEntrar').click()
    cy.wait(1000)
    cy.get('#search-function-ps').should('be.enabled')
    cy.get('#search-function-ps').type('Relatório')
    cy.wait(1000)
    cy.get('[style=""] > #form-543').click()
    cy.wait(1000)
    cy.get('#txt-localizar').type('100')
    cy.contains('button','Localizar').click()
    cy.wait(1000)
    cy.get('#idrelatorio-100').dblclick()
    cy.wait(1000)
    cy.get('#btn-action-detail > .btn').click()
    cy.get('#btn-action-options-detail > :nth-child(3)').click()
    cy.wait(1000)
    cy.get('.col-sm-12 > .card > .card-body').click()
    cy.wait(1000)
    //cy.get('#btn-action-save').click()
    const datainicial = '2023-06-01';
    cy.get('#I568A_dt_inicial')
      .click()
      .trigger('keydown', { keyCode: 35 }) 
      .trigger('input')
      .type(datainicial);
    
    const dataFinal = '2023-06-26'; 
      cy.get('#I568A_dt_final')
      .click()
      .trigger('keydown', { keyCode: 35 }) 
      .trigger('input')
      .type(dataFinal);
    

    cy.contains('button','Gerar').click()
  })
})