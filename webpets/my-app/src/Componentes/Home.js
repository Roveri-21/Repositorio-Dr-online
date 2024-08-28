import React, { useState, useEffect } from 'react';
import SearchForm from './SearchForm';
import './Home.css'
import Menu from './Menu';
import DataTable from './DataTable';
function Home() {
    return (
        <div>
            <Menu/>
            <div className='conteudo'>
                <SearchForm />
                <DataTable/>
            </div>
        </div>
    )
}
export default Home;



