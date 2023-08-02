  const cad =[
    {
      nome: 'Fabricia Nunes de Souza',
      cpf: '87657074191',
      telefone: '999028159',
      DDD: '62',
      DDI: '55',
      email: 'fabricia@centromedicogoiania.com.br',
      datanascimento: '1979-07-20'
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
    cy.get('#search-function-ps').type('Pessoa física');
    cy.wait(1000);
    cy.contains('.dropdown-item-color', 'Pessoa Física - Completo').click();
    cy.wait(1000);
    cy.get('#btn-new').click(); //<< cria um novo
    cy.wait(1000);
    cy.formatName(item.nome).then((formattedName) => {
    cy.contains('label', 'Nome').click()
    .trigger('keydown', { keyCode: 50 }) 
    .trigger('input')
    .type(formattedName)
    });
    cy.contains('label', 'CPF').click()
    .trigger('keydown', { keyCode: 50 }) 
    .trigger('input')
    .type(item.cpf)
    cy.contains('label','Data de Nascimento').click()
    .trigger('keydown', { keyCode: 35 }) 
    .trigger('input')
    .type(item.datanascimento);
    cy.contains('button',' Salvar ').click();

     cy.get('#I387_idpessoa_fisica').invoke('text').then((id) => {
      cy.wrap(id).as('idpessoa_fisica');
      const idpessoa_fisica = id; 

    //complemento residencialcy.visit("https://www.pssaude.com.br/#");
    cy.contains('a','Complemento').click();
    cy.get('#btn-md-new').click();//clica em novo
    cy.get('#I387_pessoa_fisica_compl-ie_tipo_complemento').select('2').should('be.visible');
    cy.get('#I387_pessoa_fisica_compl-ds_email').type(item.email)
    cy.get('#I387_pessoa_fisica_compl-nr_celular').type(item.telefone)
    cy.get('#I387_pessoa_fisica_compl-nr_ddd_celular').type(item.DDD)
    cy.get('#I387_pessoa_fisica_compl-nr_ddi_celular').type(item.DDI)
    cy.get('#btn-md-save').click()
    cy.wait(500) 

    //usuario 
    cy.get('#search-function-ps').should('be.enabled');
    cy.wait(500)
    cy.get('#search-function-ps').type('Usuário');
    cy.wait(500)
    cy.contains('.dropdown-item-color', 'Usuário').click();
    cy.wait(100)
    cy.get('#form_346 > #form-grid > form > .card-header > #btn-new').click(); 
    cy.wait(100)
    cy.criarUsuario(item.nome).then((usuario) => {
      cy.get('#I346_login').click().type(usuario)
    });
    /* cy.get('#I346_idpessoa_fisica').type(id);  */
  });
});
})
 })  


