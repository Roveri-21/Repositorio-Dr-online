import { BrowserRouter as Router, Switch, Route, Link } from 'react-router-dom';
import logo from './logo.svg';
import './Front.css';
import Tabela_Venda from './componentes/Tabela_Venda';
import Cadastro from './Cadastro';

function Home() { // conteudo que vai manter quando clicar em uma link
  return (
    <div>
      <div className="menu" id="menu">
        <img src="imagen/canva-brown-black-simple-modern-pet-shop-logo-3HtOB_YFCeQ.jpg" alt="Logo" />
        <ul>
          <li className='lista ativa'>
            <a href='Home.html'>
              <span className='icone'>
                <ion-icon name='paw-outline'></ion-icon>
              </span>
              <span className='lista'>Home</span>
            </a>
          </li>
        </ul>

        <ul>
          <li className='lista ativa'>
            <Link to="/Cadastro">
              <span className='icone'>
                <ion-icon name='paw-outline'></ion-icon>
              </span>
              <span className='lista'>Cadastro</span>
            </Link>
          </li>
        </ul>

        <ul>
          <li className='lista'>
            <a>
              <span className='icone'>
                <ion-icon name='cube-outline'></ion-icon>
              </span>
              <span className='lista'>Estoque</span>
            </a>
          </li>
        </ul>
        <ul>
          <li className='lista'>
            <a id='log-out'>
              <span className='icone'>
                <ion-icon name='log-out-outline'></ion-icon>
              </span>
              <span className='lista'>Sair</span>
            </a>
          </li>
        </ul>
      </div>
      <Switch>
        <Route path="/Cadastro" component={Cadastro} />
        <Route path="/" component={MainContent} />    {/*vai pegar todos os Router que começão com "/" */}
      </Switch>
    </div>
  );
}

function MainContent() { // conteudo principal que vai ser substituido
  return (
    <main className="main-content" id="main-content">
      <div className="conteudo" id="conteudo" >
        <section className="data-tabela">
          <div className='tabela' id='tabela'>
                <fieldset>
                  <legend>Ultimas vendas</legend>
                  {/* Tabela de vendas */}
                  <Tabela_Venda/>
                </fieldset>
                <canvas id="chart"></canvas>
              </div>
        </section>
        <section className="analysis">
          <legend id="labelGafricos">Analise de Ganhos do mes</legend>
              <div className="graficos">
                <div className="GraficoBarra">
                  <canvas id="myChart"></canvas>
                </div>
                <div className="GraficoRosquinha">
                  <section>
                    <canvas id="donutChart"></canvas>
                  </section>
                </div>
              </div>
        </section>
      </div>
    </main>
  );
}

function App() {
  return (
    <Router>
      <Home />
    </Router>
  );
}

export default App;

// usar a seguinte biblioteca para fazer o carregamento de pagina 
//npm install react-router-dom@5
