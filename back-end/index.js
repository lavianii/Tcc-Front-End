// npm i express mysql2 dotenv nodemon

const bd = require('./database/bd');
const express = require('express');
const app = express();

const rotas = require('./models/usuarioEnviaComunicado.js');
function middleWareGlobal(req, res, next) {
    console.time('Duraçao');
    console.log(req.url);

    next();

    console.log(req.url);
    console.timeEnd('Duraçao');
}

const servidor = async () => {

    const ret = await bd.criaTabela();

    if (ret === null) {
        console.log('Não estabeleceu a conexao com o BD');
        console.log(ret);
        process.exit(1);
    }
    if (ret === false) {
        console.log('Não foi possivel CRIAR A TABELA');
        console.log(ret);
        process.exit(1)
    }

    app.use(express.json());
    app.use(middleWareGlobal);

    app.use((req, res, next) => {
        res.header('Access-Control-Allow-Origin', '*');
        res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
        res.header('Access-Control-Allow-Headers', 'Content-Type');
        next();
    });


    app.post('/incluir', rotas.inclusao);
    app.get('/recupera/:id', rotas.recupera);
    app.delete('/remove/:id', rotas.remove);
    app.put('/atualiza/:id', rotas.atualiza);

    

    console.log('Conectado na porta 3001');
    app.listen(3001)
}
servidor();