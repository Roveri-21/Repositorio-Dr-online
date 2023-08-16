//lista de itens
let amigos = ['wendel','marcos','joel']
console.log(amigos)

// para pesquisar apenas numeros especificos do arry devemos utilizar 
console.log(amigos[0])

const numeros = [1,2,3,4,5,6,7,8,9,10];
console.log(Math.max(...numeros)); // menor numero do arry 
console.log(Math.min(...numeros)); // maior numero do arry 


const num =[7,8,9]
num.push(10,11,12) // adiciona no final 
num.unshift(1,2,3) // adiciona no inicio 
num.splice (3,0,4,5,6) // adiciona no meio porem vc tem que informar onde ela começa e o que ela vai apagar