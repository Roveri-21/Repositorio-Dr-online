import './App.css';
import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Menu from './Componentes/Menu';
import Estoque from './Componentes/Estoque';
//import Admin from './Componentes/Admin'; // Certifique-se de importar os componentes corretamente
//import Logs from './Componentes/Logs';
//import Login from './Componentes/Login';

function App() {
  return (
    <Router>
      <Menu />
      <Routes>
        <Route path="/estoque" element={<Estoque />} />
        {/* <Route path="/admin" element={<Admin />} />
        <Route path="/logs" element={<Logs />} />
        <Route path="/login" element={<Login />} /> */}
      </Routes>
    </Router>
  );
}

export default App;
