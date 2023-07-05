const faker = require('faker');
const randomName = faker.name.findName();
describe('template spec', () => { //descrever o que vou testar/
  it('passes', () => { //executavel da automação
    const nomes = ['João', 'Maria', 'Pedro', 'Ana', 'Carlos']; // Defina os nomes desejados
    cy.visit('https://homol.pssaude.com.br:4000/#') // visita no site 
    cy.wait(1000)
    cy.get(':nth-child(1) > .mx-auto > .input-group > .form-control').type('Gcypress')
    cy.get(':nth-child(2) > .mx-auto > .input-group > .form-control').type('gX$#951X7RgX')
    cy.get('#btnEntrar').click()
    cy.wait(1000)
    cy.get('#search-function-ps').should('be.enabled')
    cy.get('#search-function-ps').type('Pessoa fisica')
    cy.wait(1000)
    cy.get('#search-ul-function > :nth-child(26) > #form-387').click()
    cy.wait(1000)
    cy.get('#btn-new').click()
    cy.wait(1000)
    cy.get('#I387_nm_pessoa').type(nomes);
    cy.get('#btn-save').click()
    cy.wait(1000)
    cy.get('#btn-action-detail > .btn').click()
    cy.get('#btn-action-options-detail > :nth-child(3)').click()

  })
})
