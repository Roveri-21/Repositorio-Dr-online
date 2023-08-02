
  //usuario
  Cypress.Commands.add('criarUsuario', (nome) => {
    const palavras = nome.split(" ");
    const palavrasFiltradas = palavras.filter(palavra => palavra.length > 3);
    const iniciais = palavrasFiltradas.map(palavra => palavra[0]).join("").toUpperCase();
    const ultimoNome = palavras[palavras.length - 1].slice(1).toLowerCase();
    return iniciais + ultimoNome;
  });
  //login
  Cypress.Commands.add("login", (username, password) => {
    cy.viewport(1500, 800);
    cy.get(':nth-child(1) > .mx-auto > .input-group > .form-control').type(username);
    cy.get(':nth-child(2) > .mx-auto > .input-group > .form-control').type(password);
    cy.contains('button', 'Entrar').click();
  
  });// função para reduzir o nome 
  Cypress.Commands.add('formatName', (nome) => {
    nome = nome.toLowerCase();
    const words = nome.split(' ');
    const ignoreList = ['da', 'de', 'do', 'dos', 'das', 'e'];
    const capitalizeFirstLetter = (word) => {
      if (ignoreList.includes(word)) return word;
      return word.charAt(0).toUpperCase() + word.slice(1);
    };
    const formattedWords = words.map(capitalizeFirstLetter);
    const formattedName = formattedWords.join(' ');
    return formattedName;
  });
  //função para criar lead
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
//esconde o painel lateral  
  Cypress.Commands.add("hideCodePanel", () => {
    Cypress.$(".test-commands-container").toggle();
  });
  
  