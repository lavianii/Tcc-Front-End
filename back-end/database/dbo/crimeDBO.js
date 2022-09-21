const bd = require('../bd.js');

const incluaCrime = async (crime) => {

    const conexao = await bd.getConexao();

    if(conexao === null)
        return null;

    try {
        const sql = 'INSERT INTO crimes(bairro, tipoCrime) VALUES (?, ?)';
        const dados = [crime.bairro, crime.tipoCrime];
        await conexao.query(sql, dados);

        return true;
    } catch (error) {
        console.log(error);
        return false;
    }
}

const recuperaCrime = async (id) => {
    const conexao = await bd.getConexao();

    if(conexao === null)
        return null;

    try {
        const sql = 'SELECT bairro, tipoCrime FROM crimes WHERE id=?';
        const dados = [id];
        const [linhas] = await conexao.query(sql, dados);

        return linhas;
    } catch (error) {
        console.log(error);
        return false;
    }
}

const removeCrime = async (id) => {
    const conexao = await bd.getConexao();

    if(conexao === null)
        return null;

    try {
        const sql = 'DELETE FROM crimes WHERE id=?';
        const dados = [id];
        await conexao.query(sql, dados);

        return true;
    } catch (error) {
        console.log(error);
        return false;
    }
}

const atualizaCrime = async (crime) => {
    const conexao = await bd.getConexao();

    if(conexao === null)
        return null;
    
    try {
        const sql = 'UPDATE crimes SET bairro=?, tipoCrime=? WHERE id=?';
        const dados = [crime.bairro, crime.tipoCrime, crime.id];
        await conexao.query(sql, dados);

        return true;
    } catch (error) {
        console.log(error);
        return false;
    }
}
module.exports = { incluaCrime, recuperaCrime, removeCrime, atualizaCrime }