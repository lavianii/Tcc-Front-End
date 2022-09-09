// npm i express mysql2 dotenv nodemon
const bd = require('./db/bd.js');
const express = require('express');
const app = express();

const servidor = async () => {
    
    const ret = await bd.criaTabela();
    
    if(ret === null){
        console.log('Não estabeleceu a conexao com o BD');
        console.log(ret);
        process.exit(1);
    }
    if(ret === false){
        console.log('Não foi possivel CRIAR A TABELA');
        console.log(ret);
        process.exit(1)
    }

    app.use(express.json());


    console.log('Conectado na porta 3001')
    app.listen(3001)
}
servidor();