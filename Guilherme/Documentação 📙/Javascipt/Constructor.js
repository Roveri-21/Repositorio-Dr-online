function Creatlivro(Titulo,Autor,Paginas){
    
        this.LivroTitulo = Titulo;
        this.LivroAutor = Autor;
        this.LivroPaginas = Paginas;
    
}
const livro = new Creatlivro('Almanaque','Zeze',50)
console.log(livro)
//O this. faz o retorno automaticamente sem precisar usar o return no final do objeto
