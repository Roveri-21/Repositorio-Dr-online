let drivespeed =  80
if (drivespeed >110){
    console.log('velocidade permitida')

}
else if (drivespeed > 30 && drivespeed < 110){
    console.log('oks')
}
else
    console.log('Muito devagar')
//alteração


//function declaration
function movie(){
    console.log('the matrix')
}
movie()// traz função com o que foi definido dentro dela

// hoisting faz o codigo js trazer a função antes de ser chamada então esse exemplo funcionaria

// movie()
// function movie(){
//     console.log('the matrix')
// }

//function exepression
const car = function(){
    console.log('tesla')
}
car()// traz o que foi declarado dentro da variavel