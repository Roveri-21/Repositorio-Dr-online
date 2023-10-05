function toggleFormulario() {
  console.log(document);
  const formularioAdicionar = document.querySelector("#formularioAdicionar");
console.log(formularioAdicionar)
  if (formularioAdicionar.style.display === "none" || formularioAdicionar.style.display === "") {
      formularioAdicionar.style.display = "block";
  } else {
      formularioAdicionar.style.display = "none";
  }
}

var links = document.querySelectorAll("#menu a");
for (var i = 0; i < links.length; i++) {
  links[i].addEventListener('click', function(e) {

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

        const x = document.querySelector('#mostrarFormulario');

        
        x.addEventListener('click', toggleFormulario);
      };
      xhr.send();
     // toggleFormulario();
    }
  });
}



