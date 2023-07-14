const faker = require('faker');
  const cad =[
    {
      nome: 'Iana Dias da Silva',
      cpf: '06791759119',
      telefone: '994306327',
      DDD: '62',
      DDI: '55',
      email: 'ianadias93@gmail.com',
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
    cy.wait(1000)
    cy.get('#search-function-ps').should('be.enabled');
    cy.wait(1000)
    cy.get('#search-function-ps').type('Pessoa física');
    cy.wait(1000);
    cy.contains('.dropdown-item-color', 'Pessoa Física - Completo').click();
    cy.wait(1000);
    cy.get('#btn-new').click(); //<< cria um novo
    cy.wait(1000);
    cy.contains('label', 'Nome').click()
    .trigger('keydown', { keyCode: 50 }) 
    .trigger('input')
    .type(item.nome)
    cy.contains('label', 'CPF').click()
    .trigger('keydown', { keyCode: 50 }) 
    .trigger('input')
    .type(item.cpf)
    cy.contains('label','Data de Nascimento').click()
    .trigger('keydown', { keyCode: 35 }) 
    .trigger('input')
    .type(item.datanascimento);
    cy.contains('button',' Salvar ').click();

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
