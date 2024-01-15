import "cypress-real-events/support";

describe("Validar Crm Gerenciar lead", () => {
  beforeEach(() => {
    cy.viewport(1500, 800);
    cy.visit("https://homol.pssaude.com.br:4000/#");
    cy.login("Gcypress", "78ua7Ze&KxK%");
    cy.hideCodePanel();
  });


it.only("Realizo a movimentação da lead da etapa 1 para a etapa 2", () => {
  cy.wait(1000);
  cy.get('#search-function-ps').type('Gerenciar lead').should("be.visible");
  cy.wait(1000);
  cy.contains('.dropdown-item-color', 'CRM - Gerenciar Lead').click();
  cy.wait(1000);

  // Encontrar os elementos dragButton e etapa114
  cy.get('#drag-button').then((dragButton) => {
    cy.get('[id^="etapa-ul-"]').then((etapaElements) => {
      // Obter o primeiro elemento encontrado que corresponde ao padrão "title-etapa-"
      const etapa114Element = etapaElements[0];

      // Obter os retângulos dos elementos para o movimento
      const dragButtonRect = dragButton[0].getBoundingClientRect();
      const etapa114Rect = etapa114Element.getBoundingClientRect();

      // Simular o movimento de "arrastar e soltar" usando os comandos individuais
      cy.get('#drag-button').realMouseDown(dragButtonRect.left, dragButtonRect.top)
        .realMouseMove(dragButtonRect.left, dragButtonRect.top) // Para começar o movimento
        .realMouseMove(etapa114Rect.left + etapa114Rect.width / 2, etapa114Rect.top + etapa114Rect.height / 2) // Movimento para o destino
        .realMouseUp(etapa114Rect.left + etapa114Rect.width / 2, etapa114Rect.top + etapa114Rect.height / 2); // Soltar o botão do mouse
    });
  });
})
})