<!-- #include file = Login/Login_class.asp -->
<!DOCTYPE html>
<html lang='pt-br'>
   <head>
      <meta charset='UTF-8'>
      <meta name='viewport' content='width=device-width, initial-scale=1.0'>
      <title>WebPets</title>
      <link rel=stylesheet href=Front.css>
      <script type=module src=https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js></script>
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
      <script src="javascript/Grafico_barra.js"></script>
      <script src="javascript/Grafico_rosquinha.js"></script>
      <script src="./node_modules/chart.js/dist/Chart.js"></script> 
      <script src="javascript/logout.js"></script>
   </head>
   <body>
      <header class="header">
         <div class='menu'>
            <!-- <img src="/imagen/canva-brown-black-simple-modern-pet-shop-logo-3HtOB_YFCeQ.jpg" alt="Logo"> -->
            <!-- <img src="/imagen/canva-brown-black-simple-modern-pet-shop-logo-3HtOB_YFCeQ.jpg" alt="Logo"> -->
            <img src="imagen/canva-brown-black-simple-modern-pet-shop-logo-3HtOB_YFCeQ.jpg" alt="Logo">
            
            <ul>
               <li class='lista ativa'>
                  <a href='http://localhost/weblocal/TCC/Home.ASP'>
                     <span class='icone'>
                        <ion-icon name='paw-outline'></ion-icon>
                     </span>
                     <span class='lista'>Home</span>
                  <a>
               </li>
            </ul>
            <ul>
               <li class='lista'>
                  <a href='#' class='transacao'>
                     <span class='icone'><ion-icon name='cash-outline'></ion-icon></span>
                     <span class='lista'>Transações</span>
                  <a>
                  <ul class='Itens_transacao'>
                     <li><a href='#' class='pix'>Pix</a></li>
                     <li><a href='#' class='dinheiro'>Dinheiro</a></li>
                     <li><a href='#' class='cartao'>Cartão</a></li>
                  </ul>
               </li>
            </ul>
            <ul>
               <li class='lista'>
                  <a href='Estoque/Estoque.asp'>
                     <span class='icone'>
                        <ion-icon name='cube-outline'></ion-icon>
                        </ion-icon>
                     </span>
                     <span class='lista'>Estoque</span>
                  <a>
               </li>
            </ul>
            <ul>
               <li class='lista'>
                  <a href='#'>
                     <span class='icone'>
                        <ion-icon name='person-outline'></ion-icon>
                        </ion-icon>
                     </span>
                     <span class='lista'>Admin</span>
                  <a>
               </li>
            </ul>
            <ul>
               <li class='lista'>
                  <a href='#'>
                     <span class='icone'>
                        <ion-icon name='reader-outline'></ion-icon>
                        </ion-icon>
                     </span>
                     <span class='lista'>Logs</span>
                  <a>
               </li>
            </ul>
            <ul>
               <li class='lista'>
                  <a href='#'>
                     <span class='icone'>
                        <ion-icon name='settings-outline'></ion-icon>
                     </span>
                     <span class='lista'>Configurações</span>
                  <a>
               </li>
            </ul>
            <%
               response.write"<ul>"
                  response.write"<li class='lista'>"
                     response.write"<a href='Login/Login.asp' id='logout-link'>"
                        response.write"<span class='icone'>"
                        response.write"<ion-icon name='log-out-outline'></ion-icon>"
                        response.write"</span>"
                        response.write"<span class='lista'>Sair</span>"
                     response.write"<a>"
                  response.write"</li>"
               response.write"</ul>"
            %>
         </div>
      </header>
      <main class="main-content">
         <div class='conteudo'>
            <section class="personal-data">
               <fieldset>
                  <legend>Dados Pessoais</legend>
                  <div style='display:flex; justify-content:space-between;'>
                     <label for='nome'>Nome:</label>
                     <input type='text' id='nome' name='nome'  size='20'>
                     <label for='data'>Data de Nascimento:</label>
                     <input type='date' id='data' name='data'>
                     <button type='submit'>Enviar</button>
                  </div>
               </fieldset>
            </section>
            <section class="data-tabela">
               <div class='tabela' id='tabela'>
                  <legend>Ultimas vendas</legend>
                  <fieldset>
                     <table>
                        <thead>
                           <tr>
                              <th>Nome</th>
                              <th>Data de Nascimento</th>
                              <th>CPF</th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <td>João Silva</td>
                              <td>01/01/1990</td>
                              <td>123.456.789-00</td>
                           </tr>
                           <tr>
                              <td>Maria Souza</td>
                              <td>10/05/1985</td>
                              <td>987.654.321-11</td>
                           </tr>
                           <tr>
                              <td>Carlos Oliveira</td>
                              <td>20/12/1982</td>
                              <td>111.222.333-44</td>
                           </tr>
                        </tbody>
                     </table>
                  </fieldset>
                  <canvas id="chart"></canvas>
               </div>
            </section>
            <section class="analysis">
               <legend id="labelGafricos">Analise de Ganhos do nomemes</legend>
                  <div class="graficos">
                        <div class="GraficoBarra">                    
                                 <canvas id="myChart"></canvas>                 
                        </div>
                     <div class="GraficoRosquinha">
                        <section>      
                              <canvas id="donutChart"></canvas>
                        </section>
                     </div>
                  </div>
            </section>
         </div>
      </main>
   </body>
</html>