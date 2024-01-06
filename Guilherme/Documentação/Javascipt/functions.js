function statusSessão(status){
    console.log('transação '+ status)
}

statusSessão('APROVADO')
// Nesse caso podemos utilizar um valor ja definido para nossa função

function percentagem(price){
    return price - (price * 10 /100)
// ao colocar return em uma função ele me retornaram o valor

}
console.log(percentagem(40))