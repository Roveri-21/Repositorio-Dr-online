// Seleciona todos os links do menu
var links = document.querySelectorAll('#menu a');

// Percorre todos os links do menu
for (var i = 0; i < links.length; i++) {
  // Adiciona um evento de clique a cada link
  links[i].addEventListener('click', function(e) {
console.log('gggggggggggggg',e.target.tagName);

let tag = e.target;
if (['ION-ICON','SPAN' ].includes(tag.tagName)) {
  tag = e.target.parentElement;
}

    if (tag.name !== "log-out" ){

      
      // Previne o comportamento padrão do clique
      e.preventDefault();
      
      // Carrega o conteúdo da página via AJAX
      var xhr = new XMLHttpRequest();
      xhr.open('GET', this.getAttribute('href'));
      xhr.onload = function() {
        // Atualiza o conteúdo da página com o novo conteúdo
        document.querySelector('#conteudo').innerHTML = xhr.responseText;
      };
      xhr.send();
    }
  });
}
