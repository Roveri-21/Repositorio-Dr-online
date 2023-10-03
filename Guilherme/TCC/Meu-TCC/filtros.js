    function filtrarTabela() {
        var filtroProdutoId = document.getElementById('filtroProdutoId').value.toUpperCase();
        var filtroNomeProduto = document.getElementById('filtroNomeProduto').value.toUpperCase();
        var filtroQuantidade = document.getElementById('filtroQuantidade').value.toUpperCase();
        var filtroValorProduto = document.getElementById('filtroValorProduto').value.toUpperCase();
        var filtroDescricaoProduto = document.getElementById('filtroDescricaoProduto').value.toUpperCase();
        var filtroDataVencimento = document.getElementById('filtroDataVencimento').value.toUpperCase();
        var filtroValorEstoque = document.getElementById('filtroValorEstoque').value.toUpperCase();

        var tabela = document.querySelector('table');
        var linhas = tabela.getElementsByTagName('tr');

        for (var i = 1; i < linhas.length; i++) {
            var colunas = linhas[i].getElementsByTagName('td');
            var mostrarLinha = true;

            if (colunas) {
                if (filtroProdutoId && colunas[0]) {
                    if (colunas[0].textContent.toUpperCase().indexOf(filtroProdutoId) === -1) {
                        mostrarLinha = false;
                    }
                }

                if (filtroNomeProduto && colunas[1]) {
                    if (colunas[1].textContent.toUpperCase().indexOf(filtroNomeProduto) === -1) {
                        mostrarLinha = false;
                    }
                }

                if (filtroQuantidade && colunas[2]) {
                    if (colunas[2].textContent.toUpperCase().indexOf(filtroQuantidade) === -1) {
                        mostrarLinha = false;
                    }
                }

                if (filtroValorProduto && colunas[3]) {
                    if (colunas[3].textContent.toUpperCase().indexOf(filtroValorProduto) === -1) {
                        mostrarLinha = false;
                    }
                }

                if (filtroDescricaoProduto && colunas[4]) {
                    if (colunas[4].textContent.toUpperCase().indexOf(filtroDescricaoProduto) === -1) {
                        mostrarLinha = false;
                    }
                }

                if (filtroDataVencimento && colunas[5]) {
                    if (colunas[5].textContent.toUpperCase().indexOf(filtroDataVencimento) === -1) {
                        mostrarLinha = false;
                    }
                }

                if (filtroValorEstoque && colunas[6]) {
                    if (colunas[6].textContent.toUpperCase().indexOf(filtroValorEstoque) === -1) {
                        mostrarLinha = false;
                    }
                }

                linhas[i].style.display = mostrarLinha ? '' : 'none';
            }
        }
    }

    // Adicione event listeners para os campos de entrada
    var camposFiltro = document.querySelectorAll('input');
    for (var i = 0; i < camposFiltro.length; i++) {
        camposFiltro[i].addEventListener('input', filtrarTabela);
    }
