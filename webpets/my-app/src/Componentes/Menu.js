import './Menu.css';
import React, { useState, useEffect } from 'react';

function Menu() {
  return (
    <div className="menu" id="menu">
      <ul>
        <li>
          <a>
            <span className='icone'>
            </span>
            <span className='lista'>Home</span>
          </a>
        </li>
      </ul>
      <ul>
        <li className='lista'>
          <a href='Estoque.html'>
            <span className='icone'>
            </span>
            <span className='lista'>Estoque</span>
          </a>
        </li>
      </ul>
      <ul>
        <li className='lista'>
          <a href='Admin.html'>
            <span className='icone'>

            </span>
            <span className='lista'>Admin</span>
          </a>
        </li>
      </ul>
      <ul>
        <li className='lista'>
          <a href='Logs.html'>
            <span className='icone'>
            </span>
            <span className='lista'>Logs</span>
          </a>
        </li>
      </ul>
      <ul>
        <li className='lista'>
          <a href='Login/Login.html' id='log-out'>
            <span className='icone'>
            </span>
            <span className='lista'>Sair</span>
          </a>
        </li>
      </ul>
    </div>
  )
}

export default Menu;
