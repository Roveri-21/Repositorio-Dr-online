function run(msg) {
    let result = '10';
    let termosFace = ["Facebook", "negócio", "sobre o seu anúncio", "disponível para conversar", "rede social", "redes sociais"];
    termosFace.forEach((termo) => {
        if (msg && msg.includes && msg.includes(termo)) {
            result = '19';
        }
    });
    let termosInsta = ["Instagram"];
    termosInsta.forEach((termo) => {
        if (msg && msg.includes && msg.includes(termo)) {
            result = '78';
        }
    });
    let termosRedessociais = ["rede social"];
    termosRedessociais.forEach((termo) => {
        if (msg && msg.includes && msg.includes(termo)) {
            result = '49';
        }
    });
    return result;
}

