describe('template spec', () => {
  beforeEach(() => {
    cy.viewport(1500, 800);
    cy.visit("https://homol.pssaude.com.br:4000/#");
    cy.login("Gcypress", "78ua7Ze&KxK%");
  });

  it.only('passes', () => {
    const dataInicial = '2023-07-31';
    const dataFinal = '2023-07-20';
    const searchTerm = 'relatorio';
    const leadId = '115';
    const funil = '46';

    cy.get('#search-function-ps').click();
    cy.wait(500);
    cy.get('#search-function-ps').type('{downarrow}');
    cy.wait(500);
    cy.get('#search-function-ps').type(searchTerm);
    cy.get('#search-ul-function #form-543').click();
    cy.get('#txt-localizar').click();
    cy.wait(500);
    cy.get('#txt-localizar').type(leadId);
    cy.get('#btn-localizar').click();
    cy.get(`#ds_titulo-${leadId}`).dblclick();
    cy.get('#btn-action-detail > .btn').click();
    cy.get('#btn-action-options-detail > .dropdown-item:nth-child(3)').click();


    cy.get('#I568A_dt_ref')
      .click()
      .trigger('keydown', { keyCode: 35 })
      .trigger('input')
      .type(dataInicial);

    // cy.get('#I568A_dt_final')
    //   .click()
    //   .trigger('keydown', { keyCode: 35 })
    //   .trigger('input')
    //   .type(dataFinal);

    cy.get('#I568A_idcrm_funil')
      .click()
      .trigger('keydown', { keyCode: 35 })
      .trigger('input')
      .type(funil);
    
    cy.wait(100)

    cy.contains('button','Gerar').dblclick();
    cy.contains('button','Gerar').dblclick();
    /* cy.get('#btn-action-save').dblclick(); */
  });
});
