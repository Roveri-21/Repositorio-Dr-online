describe("Executar criar lead pessoa fisica", () => {
  beforeEach(() => {
    cy.viewport(1500, 800);
    cy.visit("https://homol.pssaude.com.br:4000/#");
    cy.login("Gcypress", "78ua7Ze&KxK%");
  });

  it("Realizo a criação da lead com cadastro do usuario", () => {
    cy.generateFakeLeadData().then((leadData) => {
      cy.wait(1000)
      cy.get('#search-function-ps').type('Gerenciar lead').should("be.visible")
      cy.wait(500)
      cy.contains('.dropdown-item-color','CRM - Gerenciar Lead').click();
      cy.wait(500)
      cy.get('#btn-new-lead').click();
      cy.get('#I985_nr_telefone').type(leadData.number);
      cy.get('#I985_ds_email').type(leadData.user);
      cy.get('#I985_nm_pessoa').type(leadData.randomname);
      cy.get('#I985_nr_cpf').type(leadData.randomcpf);
      cy.get('#I985_dt_nascimento').type(leadData.randombirth);
      cy.get('#I985_ie_sexo').select([1]).should("be.visible");
      //cy.contains('input', 'I985_idcrm_origem_lead').click();
      cy.get('#btn-idcrm_origem_lead > .fas').click();
      cy.get('tbody > :nth-child(1) > :nth-child(2)').dblclick();
      cy.contains("button", "Salvar").click();
      cy.get('.toast-body').should("have.text", "Lead Cadastrada com sucesso");
    });
  });
});


//cy.login("Gcypress", "gX$#951X7RgX");