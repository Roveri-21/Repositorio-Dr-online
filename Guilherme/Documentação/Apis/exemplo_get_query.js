

const express = require('express'); //exporta o express
const { Route } = require('react-router-dom');

const server = express();


server.get('/curso/:id', (req, res) => {
    const nome = req.query.nome;
    return res.json({ curso: `aprendendo ${nome}`});
})

server.listen(3000);