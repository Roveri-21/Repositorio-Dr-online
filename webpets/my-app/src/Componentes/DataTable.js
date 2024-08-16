import React, { useState, useEffect } from 'react';
import './DataTable.css'
function DataTable() {
   return (
      <div class='tabela' id='tabela'>
         <fieldset id='FieldseTable'>
            <legend id='legendTable'>Ultimas vendas</legend>
            <table id="tabelaProdutos" class="tabelaProdutos">
               <thead>
                  <tr>
                     <th>Nome Vendedor</th>
                     <th>Data Vencimento</th>
                     <th>CPF</th>
                     <th>Nome do Produto</th>
                     <th>Valor Produto</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td>Carlos Oliveira</td>
                     <td>20/12/2023</td>
                     <td>111.222.333-44</td>
                     <td>Captão dog</td>
                     <td>R$500,00</td>
                  </tr>
                  <tr>
                     <td>Maria Souza</td>
                     <td>10/05/2023</td>
                     <td>987.654.321-11</td>
                     <td>Magnus</td>
                     <td>R$400,00</td>
                  </tr>
                  <tr>
                     <td>João Silva</td>
                     <td>01/01/2023</td>
                     <td>444.756.789-12</td>
                     <td>Special dog</td>
                     <td>R$200,00</td>
                  </tr>
                  <tr>
                     <td>Guilherme Silva</td>
                     <td>01/05/2023</td>
                     <td>333.466.789-46</td>
                     <td>Special dog</td>
                     <td>R$150,00</td>
                  </tr>
                  <tr>
                     <td>Gabriel Silva</td>
                     <td>01/12/2023</td>
                     <td>222.456.789-02</td>
                     <td>Special dog</td>
                     <td>R$100,00</td>
                  </tr>
                  <tr>
                     <td>Carlos Oliveira</td>
                     <td>20/12/2023</td>
                     <td>111.222.333-44</td>
                     <td>Captão dog</td>
                     <td>R$500,00</td>
                  </tr>
                  <tr>
                     <td>Maria Souza</td>
                     <td>10/05/2023</td>
                     <td>987.654.321-11</td>
                     <td>Magnus</td>
                     <td>R$400,00</td>
                  </tr>
                  <tr>
                     <td>João Silva</td>
                     <td>01/01/2023</td>
                     <td>444.756.789-12</td>
                     <td>Special dog</td>
                     <td>R$200,00</td>
                  </tr>
                  <tr>
                     <td>Guilherme Silva</td>
                     <td>01/05/2023</td>
                     <td>333.466.789-46</td>
                     <td>Special dog</td>
                     <td>R$150,00</td>
                  </tr>
                  <tr>
                     <td>Gabriel Silva</td>
                     <td>01/12/2023</td>
                     <td>222.456.789-02</td>
                     <td>Special dog</td>
                     <td>R$100,00</td>
                  </tr>
                  <tr>
                     <td>Carlos Oliveira</td>
                     <td>20/12/2023</td>
                     <td>111.222.333-44</td>
                     <td>Captão dog</td>
                     <td>R$500,00</td>
                  </tr>
                  <tr>
                     <td>Maria Souza</td>
                     <td>10/05/2023</td>
                     <td>987.654.321-11</td>
                     <td>Magnus</td>
                     <td>R$400,00</td>
                  </tr>
                  <tr>
                     <td>João Silva</td>
                     <td>01/01/2023</td>
                     <td>444.756.789-12</td>
                     <td>Special dog</td>
                     <td>R$200,00</td>
                  </tr>
                  <tr>
                     <td>Guilherme Silva</td>
                     <td>01/05/2023</td>
                     <td>333.466.789-46</td>
                     <td>Special dog</td>
                     <td>R$150,00</td>
                  </tr>
                  <tr>
                     <td>Gabriel Silva</td>
                     <td>01/12/2023</td>
                     <td>222.456.789-02</td>
                     <td>Special dog</td>
                     <td>R$100,00</td>
                  </tr>
                  <tr>
                     <td>Carlos Oliveira</td>
                     <td>20/12/2023</td>
                     <td>111.222.333-44</td>
                     <td>Captão dog</td>
                     <td>R$500,00</td>
                  </tr>
                  <tr>
                     <td>Maria Souza</td>
                     <td>10/05/2023</td>
                     <td>987.654.321-11</td>
                     <td>Magnus</td>
                     <td>R$400,00</td>
                  </tr>
                  <tr>
                     <td>João Silva</td>
                     <td>01/01/2023</td>
                     <td>444.756.789-12</td>
                     <td>Special dog</td>
                     <td>R$200,00</td>
                  </tr>
                  <tr>
                     <td>Guilherme Silva</td>
                     <td>01/05/2023</td>
                     <td>333.466.789-46</td>
                     <td>Special dog</td>
                     <td>R$150,00</td>
                  </tr>
                  <tr>
                     <td>Gabriel Silva</td>
                     <td>01/12/2023</td>
                     <td>222.456.789-02</td>
                     <td>Special dog</td>
                     <td>R$100,00</td>
                  </tr>
               </tbody>
            </table>
            <button id='refresh'>50</button>
            <button id='refresh'>100</button>
            <button id='refresh'>150</button>
         </fieldset>
      </div>

   )
}
export default DataTable;