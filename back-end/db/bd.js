const getConexao = async () => {

    if (global.conexao && global.conexao.state !== 'disconnected')
        return global.conexao;

    const mysql = require('mysql2/promise');
    const bdConfig = require('./bdConfig');

    try {
        const conexao = await mysql.createConnection(bdConfig);
        global.conexao = conexao;
        return conexao;

    } catch (error) {
        return null;
    }

}

async function criaTabela() {

    const conexao = await getConexao();

    if (conexao === undefined)
        return null;

    sqlUsuario = 'CREATE TABLE IF NOT EXISTS usuario(id INT not null AUTO_INCREMENT, nome VARCHAR(60)NOT NULL, senha VARCHAR(20) NOT NULL, email VARCHAR(60), PRIMARY KEY (id));';

    try {

        await conexao.query(sqlUsuario);
        return true;

    } catch (error) {

        return false;
    }
}
module.exports = { getConexao, criaTabela }