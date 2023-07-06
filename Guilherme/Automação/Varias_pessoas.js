const faker = require('faker');
  const cad =[//declarar uma variável com um valor que não pode ser alterado após a sua atribuição inicial
      {
        nome: 'JACQUELINE DA SILVA BELLE',
        cpf: '03417308151',
        telefone: '985352105',
        DDD: '62',
        DDI: '55',
        email: 'jack10belle@icloud.com',
        datanascimento: '1992-02-18'
      }, 
      {
        nome: 'JACQUELINE DA SILVA BELLE',
        cpf: '03417308151',
        telefone: '985352105',
        DDD: '62',
        DDI: '55',
        email: 'jack10belle@icloud.com',
        datanascimento: '1992-02-18'
      }
  ]
cad.forEach((item, index)=> {
describe('template spec', () => {
  //it('Pessoa_fisica', () => {
  it(`${index + 1} - fills and submits the form based on a predefined list of data`, () => {
    cy.visit('https://homol.pssaude.com.br:4000/#');
    cy.wait(1000);
    cy.get(':nth-child(1) > .mx-auto > .input-group > .form-control').type('Gcypress');
    cy.get(':nth-child(2) > .mx-auto > .input-group > .form-control').type('gX$#951X7RgX');
    cy.get('#btnEntrar').click();
    cy.get('#search-function-ps').should('be.enabled');
    cy.get('#search-function-ps').type('Pessoa física');
    cy.wait(1000);
    cy.contains('.dropdown-item-color', 'Pessoa Física - Completo').click();
    cy.wait(1000);
    cy.get('#btn-new').click(); //<< cria um novo
    cy.wait(1000);
    cy.get('#I387_nm_pessoa').type(item.nome) //input nome
    cy.contains('label', 'CPF').click()
    .trigger('keydown', { keyCode: 50 }) 
    .trigger('input')
    .type(item.cpf)
    cy.get('#I387_dt_nascimento') //input data
    .click()
    .trigger('keydown', { keyCode: 35 }) 
    .trigger('input')
    .type(item.datanascimento);
    cy.get('#btn-save').click();
    //complemento residencial
    cy.contains('a','Complemento').click();
    cy.get('#btn-md-new').click();//clica em novo
    cy.get('#I387_pessoa_fisica_compl-ie_tipo_complemento').select('2').should('be.visible');
    cy.get('#I387_pessoa_fisica_compl-ds_email').type(item.email)
    cy.get('#I387_pessoa_fisica_compl-nr_celular').type(item.telefone)
    cy.get('#I387_pessoa_fisica_compl-nr_ddd_celular').type(item.DDD)
    cy.get('#I387_pessoa_fisica_compl-nr_ddi_celular').type(item.DDI)
    cy.get('#btn-md-save').click()

  });
});
})