
const cad =[
    {
      "id": "28"
    },
    {
      "id": "29"
    },
    {
      "id": "30"
    },
    {
      "id": "31"
    },
    {
      "id": "32"
    },
    {
      "id": "32"
    },
    {
      "id": "34"
    },
    {
      "id": "38"
    },
    {
      "id": "39"
    },
    {
      "id": "39"
    },
    {
      "id": "41"
    },
    {
      "id": "44"
    },
    {
      "id": "45"
    },
    {
      "id": "48"
    },
    {
      "id": "58"
    },
    {
      "id": "74"
    },
    {
      "id": "81"
    },
    {
      "id": "83"
    },
    {
      "id": "85"
    },
    {
      "id": "87"
    },
    {
      "id": "97"
    },
    {
      "id": "101"
    },
    {
      "id": "123"
    },
    {
      "id": "115"
    },
    {
      "id": "127"
    },
    {
      "id": "133"
    },
    {
      "id": "140"
    }  
  ]
cad.forEach((item, index)=> {
  describe('template spec', () => {
      beforeEach(() => {
        cy.viewport(1500, 800);
        cy.visit("https://www.pssaude.com.br/");
        cy.login("grsilva", "gui21@RS");
        // cy.visit("https://www.pssaude.com.br/#");
        //  cy.loginOnce();
    });
  it(`${index + 1} - fills and submits the form based on a predefined list of data`, () => {
    // const id = '26';
    cy.wait(1000)
    cy.get('#search-function-ps').should('be.enabled');
    cy.wait(1000)
    cy.get('#search-function-ps').type('Relatório');
    cy.wait(1000);
    cy.contains('.dropdown-item-color', 'Relatório').click();
    cy.wait(1000);
    cy.get('#txt-localizar').type(item.id);
    cy.get('#btn-localizar').dblclick();
    cy.wait(500);
    cy.get(`#ds_titulo-${item.id}`).dblclick();
    cy.wait(1000);
    cy.get('#relatorio_usuario_2025-tab').dblclick();
    cy.wait(100);
    cy.get('#btn-md-new').click();
    cy.get('#I2025_relatorio_usuario-login_usuario').type('mesilva')
    cy.get('#btn-md-save').click();
    cy.get('#btn-md-save').click();
    // cy.get('#btn-new').click(); //<< cria um novo
    // cy.wait(1000);
    // cy.contains('label', 'Nome').click()
    // .trigger('keydown', { keyCode: 50 }) 
    // .trigger('input')
    // .type(item.nome)
    // cy.contains('label', 'CPF').click()
    // .trigger('keydown', { keyCode: 50 }) 
    // .trigger('input')
    // .type(item.cpf)
    // cy.contains('label','Data de Nascimento').click()
    // .trigger('keydown', { keyCode: 35 }) 
    // .trigger('input')
    // .type(item.datanascimento);
    // cy.contains('button',' Salvar ').click();

    // //complemento residencial
    // // cy.contains('a','Complemento').click();
    // // cy.get('#btn-md-new').click();//clica em novo
    // // cy.get('#I387_pessoa_fisica_compl-ie_tipo_complemento').select('2').should('be.visible');
    // // cy.get('#I387_pessoa_fisica_compl-ds_email').type(item.email)
    // // cy.get('#I387_pessoa_fisica_compl-nr_celular').type(item.telefone)
    // // cy.get('#I387_pessoa_fisica_compl-nr_ddd_celular').type(item.DDD)
    // // cy.get('#I387_pessoa_fisica_compl-nr_ddi_celular').type(item.DDI)
    // // cy.get('#btn-md-save').click()

    // cy.get('#search-function-ps').should('be.enabled');
    // cy.wait(1000);
    // cy.get('#search-function-ps').type('Usuário');
    // cy.wait(1000);
    // cy.contains('.dropdown-item-color', 'Usuário').click();
    // cy.wait(1000);
    // cy.get('[id="btn-new"]').dblclick({force: true}); // Seleciona o primeiro elemento com o ID "btn-new" e clica nele
    // cy.criarUsuario(item.nome).then((usuario) => {
    //   cy.contains('label','Usuário').click()
    //     .trigger('keydown', { keyCode: 50 }) 
    //     .trigger('input')
    //     .type(usuario);
    // });
  });
});
})
