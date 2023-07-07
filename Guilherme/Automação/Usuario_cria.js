const faker = require('faker');
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
/*       {
      nome: 'Jéssica Rodrigues',
      cpf: '75295610144',
      telefone: '994976854',
      DDD: '62',
      DDI: '55',
      email: 'jessicarodriguesmarcieldo@hotmail.com',
      datanascimento: '1993-11-10'
      },
      {
      nome: 'Thais cordeiro de faria Barbosa',
      cpf: '04592244176',
      telefone: '993056370',
      DDD: '62',
      DDI: '55',
      email: 'thaiscordeiro98769@gmail.com',
      datanascimento: '2001-09-29'
      },
      {
      nome: 'Isadora Moraes',
      cpf: '04288794110',
      telefone: '996448410',
      DDD: '62',
      DDI: '55',
      email: 'isadora.tj99@gmail.com',
      datanascimento: '1999-08-28'
      },
      {
      nome: 'Carolina de Jesus Reis',
      cpf: '03084022194',
      telefone: '981560865',
      DDD: '62',
      DDI: '55',
      email: 'carolgynferreira@gmail.com',
      datanascimento: '1991-11-14'
      },
      {
      nome: 'Adha Evenny Marques',
      cpf: '05512836102',
      telefone: '982749052',
      DDD: '62',
      DDI: '55',
      email: 'adhaevenny_@hotmail.com',
      datanascimento: '1995-01-01'
      },
      {
      nome: 'Gabriel Alves da Silva',
      cpf: '70666913188',
      telefone: '994938512',
      DDD: '62',
      DDI: '55',
      email: 'gabrielalvesamuel@gmail.com',
      datanascimento: '2000-07-31'
      },
      {
      nome: 'Iana Dias da Silva',
      cpf: '04305099101',
      telefone: '985383427',
      DDD: '62',
      DDI: '55',
      email: 'ianadias93@gmail.com',
      datanascimento: '1997-03-01'
      },
      {
      nome: 'JORDANNA MAGALHÃES DIAS',
      cpf: '70415409101',
      telefone: '994383646',
      DDD: '62',
      DDI: '55',
      email: 'jordanna.dias@hotmail.com',
      datanascimento: '1998-09-11'
      },
      {
      nome: 'Cecília Martins Alves',
      cpf: '70626795184',
      telefone: '999046242',
      DDD: '62',
      DDI: '55',
      email: 'ceciliamartins2614@gmail.com',
      datanascimento: '2003-02-26'
      },
      {
      nome: 'YZABELLY FERNANDES@GMAIL.COM',
      cpf: '01557806110',
      telefone: '994417998',
      },
      {
      nome: 'YZABELLY FERNANDES@GMAIL.COM',
      cpf: '01557806110',
      telefone: '994417998',
      DDD: '62',
      DDI: '55',
      email: 'YZABELLYFERNANDES@GMAIL.COM',
      datanascimento: '1986-11-13'
      },
      {
      nome: 'Gisner Souza Alves Pereira',
      cpf: '30733987168',
      telefone: '99159289',
      DDD: '62',
      DDI: '55',
      email: 'gisnerpereira@gmail.com',
      datanascimento: '1963-10-13'
      } */
  ]
cad.forEach((item, index)=> {
describe('template spec', () => {
  //it('Pessoa_fisica', () => {
  it(`${index + 1} - fills and submits the form based on a predefined list of data`, () => {
    cy.visit('https://homol.pssaude.com.br:4000/');
    cy.wait(1000);
    cy.get(':nth-child(1) > .mx-auto > .input-group > .form-control').type('Gcypress');
    cy.get(':nth-child(2) > .mx-auto > .input-group > .form-control').type('gX$#951X7RgX');
    cy.get('#btnEntrar').click();  
    cy.get('#search-function-ps').should('be.enabled');
    cy.wait(1000);
    cy.get('#search-function-ps').type('Pessoa física');
    cy.wait(1000);
    cy.contains('.dropdown-item-color', 'Pessoa Física - Completo').click();
    cy.wait(1000);
    cy.get('#campo-localizar').select('nm_pessoa').type('nm_pessoa');
    
    const usuario = cy.criarUsuario(item.nome)
    
    cy.get('#txt-localizar').type(usuario);
    
    /* cy.contains('button','Localizar').click()
    cy.contains(item.nome).dblclick();
     */

/* 

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
 */
  });
});
})



/* Produção
    cy.visit('https://www.pssaude.com.br/');
    cy.wait(1000);
    cy.get(':nth-child(1) > .mx-auto > .input-group > .form-control').type('grsilva');
    cy.get(':nth-child(2) > .mx-auto > .input-group > .form-control').type('gui21@RS');
    cy.get('#btnEntrar').click();  */

/* homologação
    cy.visit('https://homol.pssaude.com.br:4000/');
    cy.wait(1000);
    cy.get(':nth-child(1) > .mx-auto > .input-group > .form-control').type('Gcypress');
    cy.get(':nth-child(2) > .mx-auto > .input-group > .form-control').type('gX$#951X7RgX');
    cy.get('#btnEntrar').click();  */