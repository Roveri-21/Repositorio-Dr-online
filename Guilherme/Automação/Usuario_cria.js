// const faker = require('faker');
const cad =[
  {
    nome: 'Anna Flávia Nunes dos Santos',
    cpf: '06791759119',
    telefone: '994306327',
    DDD: '62',
    DDI: '55',
    email: 'almeidaannaflavia997@gmail.com',
    datanascimento: '1999-09-04'
    }
]
cad.forEach((item, index)=> {
describe('template spec', () => {
beforeEach(() => {
  cy.viewport(1500, 800);
  cy.visit("https://homol.pssaude.com.br:4000/#");
  cy.login("Gcypress", "gX$#951X7RgX");
});

it(`${index + 1} - fills and submits the form based on a predefined list of data`, () => {
  cy.get('#search-function-ps').should('be.enabled');
  cy.wait(1000);
  cy.get('#search-function-ps').type('Pessoa física');
  cy.wait(1000);
  cy.contains('.dropdown-item-color', 'Pessoa Física - Completo').click();
  cy.wait(1000);
  cy.get('#campo-localizar').select('nm_pessoa').type('nm_pessoa');

  cy.criarUsuario(item.nome).then((usuario) => {
    cy.get('#txt-localizar').type(usuario);
  });
});
});
});