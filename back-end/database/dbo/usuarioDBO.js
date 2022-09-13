const bd = require('../bd.js');

const inclua = async (usuario) => {

    const conexao = await bd.getConexao();

    if (conexao === null)
        return null;

    try {
        const sql = 'INSERT INTO usuario(id, nome, senha, email) VALUES (?, ?, ?, ?)';
        const dados = [usuario.id,usuario.nome, usuario.senha, usuario.email];
        await conexao.query(sql, dados);

        return true;

    } catch (error) {
        console.log(error);
        return false;
    }

}

const atualiza = async (usuario) => {

    const conexao = await bd.getConexao();

    if (conexao === null)
        return null;

    try {
        const sql = 'UPADTE usuario SET nome=?, senha=?, email=? WHERE id=?';
        const dados = [usuario.nome, usuario.senha, usuario.email, usuario.id];
        await conexao.query(sql, dados);

        return true;


    } catch (error) {
        console.log(error);
        return null;
    }



}

const remove = async (id) => {
    const conexao = await bd.getConexao();

    if (conexao === null)
        return null;

    try {
        const sql = 'DELETE FROM usuario WHERE id=?';
        const dados = [id];
        await conexao.query(sql, dados);

        return true;
    } catch (error) {
        console.log(error);
        return false;
    }
}

const recupera =  async (id) => {
    const conexao = await bd.getConexao();

    if(conexao === null)
        return null;
    
    try {

        const sql = 'SELECT id FROM usuario WHERE id=?';
        const dados = [id];
        const [linhas] = await conexao.query(sql, dados);

        return linhas;
        
    } catch (error) {
        console.log(error);
        return false;
    }
}
module.exports = { inclua, atualiza, remove, recupera }

