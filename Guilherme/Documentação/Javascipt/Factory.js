function creatpessoa (Nome,SobreNome){
    const Pessoa ={
        PrimeiroNome: Nome,
        NomeMeio:SobreNome,
        // Pais:{
        //     NomePai:'Hilton',
        //     NomeMãe:'Evelise'
        // },
        // PrintNome: function(){
        //     console.log('Olá')
        // }
    }
    return Pessoa
}

//console.log(guilherme.objetos)

const Pessoa1= creatpessoa('Guilherme','Roveri Silva')
const Pessoa2= creatpessoa('Gabriel','Roveri Silva')
console.log(Pessoa1,Pessoa2)