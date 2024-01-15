const faker = require('faker');
const randomName = faker.name.findName();
const numeroTelefone = faker.phone.phoneNumber();
describe('template spec', () => {
  it('passes', () => {
    cy.visit('https://homol.pssaude.com.br:4000/')
    cy.get('.row:nth-child(1) .form-control').click();
    cy.get('.row:nth-child(1) .form-control').type('Gcypress');
    cy.get('.mt-3 .form-control').click();
    cy.get('.mt-3 .form-control').type('gX$#951X7RgX');
    cy.contains('button','Entrar').click()
    cy.wait(1000)
    cy.get('#search-function-ps').type('CRM - Gerenciar Lead')
    cy.wait(1000)
    cy.get('[style=""] > #form-992').click()
    cy.get('#btn-idcrm_funil > .fas').click()
    cy.get('.odd > :nth-child(2)').dblclick()
    cy.wait(1000)
    cy.get('#modal-action-form-div')
    //cy.contains('button','Salvar').click()
    //cy.contains('button','Salvar').dblclick()
    cy.get('#btn-action-save').click()
    cy.get('#btn-new-lead').click()
    cy.get('#I985_nr_telefone').type(numeroTelefone);
    cy.get('#I985_nm_pessoa').type(randomName);
    cy.get('#btn-create-lead').click()
    cy.wait(1000)
    cy.get('#btn-create-lead').click()
  })
})



