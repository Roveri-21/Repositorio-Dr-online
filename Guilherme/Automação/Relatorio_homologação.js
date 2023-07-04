/// <reference types='Cypress' />


describe('template spec', () => { //descrever o que vou testar/
    it.only('passes', () => { //executavel da automação
      cy.visit('https://homol.pssaude.com.br:4000/');
  cy.get('.row:nth-child(1) .form-control').click();
  cy.get('.row:nth-child(1) .form-control').type('Gcypress');
  cy.get('.mt-3 .form-control').click();
  cy.get('.mt-3 .form-control').type('gX$#951X7RgX');
  cy.get('#btnEntrar').click();
  cy.get('.sc-eDvSVe > form').submit();
  cy.get('#search-function-ps').click();
  cy.get('#search-function-ps').type('{downarrow}');
  cy.wait(1000)
  cy.get('#search-function-ps').type('relatorio');
  cy.get('#search-ul-function #form-543').click();
  cy.get('#txt-localizar').click();
  cy.wait(1000)
  cy.get('#txt-localizar').type('126');
  cy.get('#btn-localizar').click();
  cy.get('#ds_titulo-126').dblclick();
  cy.get('#btn-action-detail > .btn').click();
  cy.get('#btn-action-options-detail > .dropdown-item:nth-child(3)').click();
  cy.get('#btn-action-save').click();
  //cy.get('#modal-action-form').submit();
  const datainicial = '2023-06-01';
  cy.get('#I568A_dt_inicial')
    .click()
    .trigger('keydown', { keyCode: 35 }) 
    .trigger('input')
    .type(datainicial);
  
  const dataFinal = '2023-07-04'; 
    cy.get('#I568A_dt_final')
    .click()
    .trigger('keydown', { keyCode: 35 }) 
    .trigger('input')
    .type(dataFinal);
  
  
  cy.contains('button','Gerar').click()
  
    })
  })
  
  //Gcypress
  //gX$#951X7RgX
  //
  