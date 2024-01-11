const express = require('express'); //exporta o express
const { Route } = require('react-router-dom');

const server = express();

// localhost:3000/curso
server.get('/curso/:id', (req, res) => {
    const id = req.params.id;
    return res.json({ curso: `id ${id}`});
})

server.listen(3000);



//outro exemplo


const express = require('express'); //exporta o express
const { Route } = require('react-router-dom');

const server = express();
const curso = ['Node Js', 'JavaScript','React']
// localhost:3000/curso
server.get('/curso/:index', (req, res) => {
        const { index } = req.params
    return res.json(curso[index]);
})

server.listen(3000);










const express = require('express'); //exporta o express
const { Route } = require('react-router-dom');

const server = express();
const cursos = ['Node Js', 'JavaScript','React']
// localhost:3000/curso

server.get('/cursos/', (req, res) => {
    
return res.json(cursos);
});


server.listen(3000);









