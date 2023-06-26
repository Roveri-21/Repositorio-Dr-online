//Operadores logicos 
//exemplo 1
let temIdadeMinima = false
let temTituloEleitor = false

let voto =  temIdadeMinima && temTituloEleitor
console.log('Pode votar: ' + voto)

// and = &&
// or = ||
// negação = !

 
//exemplo 2
let corCarro = undefined
let corEstoque = 'black'
let corVendido = corCarro||corEstoque
console.log(corVendido)