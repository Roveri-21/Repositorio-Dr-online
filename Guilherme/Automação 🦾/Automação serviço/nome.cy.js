// const faker = require('faker');
const cad =[
  {
    nome: 'Iana Dias da Silva',
    cpf: '04305099101',
    telefone: '985383427',
    DDD: '62',
    DDI: '55',
    email: 'iana.dias@centromedicogoiania.com.br',
    datanascimento: '1993-05-01'
  } 
]
cad.forEach((item, index)=> {
describe('template spec', () => {
beforeEach(() => {
  cy.viewport(1500, 800);
  cy.visit("https://homol.pssaude.com.br:4000/#");
  cy.login("Gcypress", "78ua7Ze&KxK%");
});

it(`${index + 1} - fills and submits the form based on a predefined list of data`, () => {
  cy.wait(1000)
  cy.get('#search-function-ps').should('be.enabled');
  cy.wait(1000)
  cy.get('#search-function-ps').type('Usuário');
  cy.wait(1000);
  cy.contains('.dropdown-item-color', 'Usuário').click();
  cy.wait(1000);
  cy.contains('button', 'Novo').click();
  cy.wait(100)
  /* cy.get('#btn-idpessoa_fisica').click(); */
  cy.contains('button','btn-idpessoa_fisica').click();
  cy.wait(100)
  cy.get('#campo-localizar-fk').select('Nome').should('be.visible');
  cy.wait(100)
  cy.get('#txt-localizar-fk').type(item.nome)
  cy.wait(1000)
  cy.get('#btn-localizar-fk').click();
  cy.wait(1000)
  cy.get('.odd > :nth-child(2)').should('contain', item.nome).dblclick();
  cy.criarUsuario(item.nome).then((usuario) => {
    cy.get('#I2784_login').click().type(usuario)
  });
  cy.get('#btn-save').click();
  cy.wait(1000)
  cy.get('#usuario_estab_2784-tab').click()
  cy.wait(1000)
  cy.get('#btn-md-new').click()
  cy.wait(1000)

});
});
});
