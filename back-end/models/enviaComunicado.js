const comunicado = require('./comunicado');
const usuario = require('./usuario');
const usuarioDBO = require('../database/dbo/usuarioDBO')


const inclusao = async (req, res) => {

    if (Object.values(req.body).length < 3 || !req.body.nome || !req.body.senha || !req.body.email) {

        const erro = comunicado.novoComunicado('Ddi', 'Dados inesperados', 'Não foram fornecidos as informações esperadas').object;

        return res.status(422).json(erro);
    }

    let novoUsuario;
    try {
        novoUsuario = usuario.novoUsuario(req.body.id, req.body.nome, req.body.senha, req.body.email);
    }
    catch (error) {
        const erro = comunicado.novoComunicado('TDE', 'Dados de tipos errados', 'Dados fornecidos incorretos').object;
        return res.status(422).json(erro);
    }

    const ret = await usuarioDBO.inclua(novoUsuario);

    if (ret === null) {
        const erro = comunicado.novoComunicado('CBD', 'Sem conexao com o BD', 'Não foi possivel estabelecer conexao com o banco de dados').object;

        return res.status(500).json(erro);
    }

    if (ret === false) {
        const erro = comunicado.novoComunicado('USE', 'Usuario já existe', 'Já existe um Usuario com esse id').object;
        return res.status(409).json(erro);
    }

    const sucesso = comunicado.novoComunicado('IBS', 'Inclusao bem sucedida', 'Incluido com sucesso').object;
    return res.status(201).json(sucesso);
}

const recupera = async (req, res) => {

    if (Object.values(req.body).length != 0) {
        const erro = comunicado.novo('DSP', 'Fornecimento de dados sem proposito', 'Foram fornecidos dados desnecessarios').object;
        return res.status(422).json(erro);
    }

    const id = req.params.id;
    const ret = await usuarioDBO.recupera(id);


    if (ret === null) {
        const erro = comunicado.novoComunicado('CBD', 'Sem conexao com o BD', 'Não foi possivel estabelecer conexao com o banco de dados').object;
        return res.status(500).json(erro);
    }

    if (ret === false) {
        const erro = comunicado.novoComunicado('FNC', 'Falha no comando de SQL', 'O comando de SQL apresenta algum erro').object;
        return res.status(409).json(erro);
    }

    if (ret.length === 0) {
        const erro = comunicado.novoComunicado('PNE', 'Pessoa inexistente', 'Não há pessoas cadastrado com esse cpf').object;
        return res.status(404).json(erro);
    }

    return res.status(200).json(ret);
}

module.exports = { inclusao, recupera }