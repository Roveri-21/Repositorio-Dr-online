
class ModuloDeImpressao {
    constructor() {
        this._codigo = 10;
    }
    imprime(nomes) {
        nomes.forEach(nome => {
        console.log(`${this._codigo}: ${nome}`);
    });
  }
}


const professores = ['Elias', 'Yuri','Gabriel', 'Guilherme','Yan'];
const impressao = new ModuloDeImpressao();
impressao.imprime(professores);