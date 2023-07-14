//funções

Cypress.Commands.add('criarUsuario', (nome) => {
        const palavras = nome.split(" ");
      
        // Filtra as palavras com mais de três letras
        const palavrasFiltradas = palavras.filter(palavra => palavra.length > 3);
        
        // Obtém as iniciais das palavras filtradas
        const iniciais = palavrasFiltradas.map(palavra => palavra[0]).join("").toUpperCase();
        
        // Obtém o último nome e remove a primeira letra
        const ultimoNome = palavras[palavras.length - 1].slice(1).toLowerCase();
        
        // Retorna as iniciais e o último nome concatenados
        return iniciais + ultimoNome;
      });
      
      Cypress.Commands.add("login", (username, password) => {
        cy.viewport(1500, 800);
        cy.visit("https://homol.pssaude.com.br:4000/#");
        cy.get(':nth-child(1) > .mx-auto > .input-group > .form-control').type(username);
        cy.get(':nth-child(2) > .mx-auto > .input-group > .form-control').type(password);
        cy.contains('button', 'Entrar').click();
      });
    
    import { realMouseDown, realMouseMove, realMouseUp } from "cypress-real-events";
    
    Cypress.Commands.add("dragAndDrop", { prevSubject: true }, (subject, target) => {
      cy.wrap(subject).realDragAndDrop(target);
    });
    
    import moment from "moment";
    
    Cypress.Commands.add("generateFakeLeadData", () => {
      let faker = require("faker-br");
      const moment = require("moment");
      faker.locale = 'pt_BR';
      let randomname = faker.name.findName();
      let randomcpf = faker.br.cpf();
      let data = faker.date.past(20, 1990);
      let user = faker.internet.email();
      let randombirth = moment(data).format("YYYY-MM-DD");
      let number = faker.phone.phoneNumber("(62) 99###-####");
    
      return {
        randomname,
        randomcpf,
        user,
        randombirth,
        number
      };
    });