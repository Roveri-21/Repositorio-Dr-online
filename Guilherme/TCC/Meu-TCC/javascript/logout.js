
document.addEventListener("DOMContentLoaded", function() {
  var logoutLink = document.getElementById("logout-link");

  if (logoutLink) {
    logoutLink.addEventListener("click", function(event) {
      event.preventDefault(); // Impede o comportamento padrão do link

      // Realiza o redirecionamento para a tela de login
      window.location.href = "Login/Login.asp";
    });
  }
});

history.pushState(null, null, location.href);
window.onpopstate = function(event) {
    history.go(1);
};
