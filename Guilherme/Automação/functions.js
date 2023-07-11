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
      