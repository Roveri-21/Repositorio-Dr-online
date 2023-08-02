describe("Executar criar lead pessoa fisica", () => {
    beforeEach(() => {
      cy.viewport(1500, 800);
      cy.visit("https://homol.pssaude.com.br:4000/#");
      cy.login("cypress01", "Cypress@123");
    })
  
    it("Realizo a criação da lead com cadastro do usuario", () => {
  
      cy.wait(1000)
        cy.get('#search-function-ps').type('Gerenciar lead').should("be.visible")
      cy.contains('.dropdown-item-color','CRM - Gerenciar Lead').click()
      cy.get('#btn-function-lead > .fas').should("be.visible").click()
      cy.get('.dropdown-menu > .card > .card-header').should('be.visible')
      cy.get('.dropdown-menu > .card-body > #btn-archive-etapa').click()
  
      });
    });