import './Menu.css';
import React from 'react';
import { Link } from 'react-router-dom';

function Menu() {
  return (
    <div className="menu" id="menu">
      <ul>
        <li>
          <Link to="/">
            <span className='icone'></span>
            <span className='lista'>Home</span>
          </Link>
        </li>
      </ul>
      <ul>
        <li className='lista'>
          <Link to="/estoque">
            <span className='icone'></span>
            <span className='lista'>Estoque</span>
          </Link>
        </li>
      </ul>
      <ul>
        <li className='lista'>
          <Link to="/admin">
            <span className='icone'></span>
            <span className='lista'>Admin</span>
          </Link>
        </li>
      </ul>
      <ul>
        <li className='lista'>
          <Link to="/logs">
            <span className='icone'></span>
            <span className='lista'>Logs</span>
          </Link>
        </li>
      </ul>
      <ul>
        <li className='lista'>
          <Link to="/login">
            <span className='icone'></span>
            <span className='lista'>Sair</span>
          </Link>
        </li>
      </ul>
    </div>
  );
}

export default Menu;
