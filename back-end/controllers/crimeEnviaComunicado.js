const comunicado = require('../models/comunicado');
const crime = require('../models/cirme');
const crimeDBO = require('../database/dbo/crimeDBO');

const incluaCrime = async (req, res) => {

    if(Object.values(req.body).length < 2 || !req.body.bairro || !req.body.tipoCrime){

        const erro = comunicado.novoComunicado('Ddi', 'Dados inesperados', 'Não foram fornecidos as informações esperadas').object;

        return res.status(422).json(erro);
    }

    let novoCrime;

    try {
        novoCrime = crime.novoCrime(req.body.id, req.body.bairro,req.body.tipoCrime);
    } catch (error) {
        const erro = comunicado.novoComunicado('TDE', 'Dados de tipos errados', 'Dados fornecidos incorretos').object;
        return res.status(422).json(erro);
    }

    const ret = await crimeDBO.incluaCrime(novoCrime);

    if (ret === null) {
        const erro = comunicado.novoComunicado('CBD', 'Sem conexao com o BD', 'Não foi possivel estabelecer conexao com o banco de dados').object;

        return res.status(500).json(erro);
    }

    if (ret === false) {
        const erro = comunicado.novoComunicado('USE', 'Crime já existe', 'Já existe um Crime com esse id').object;
        return res.status(409).json(erro);
    }

    const sucesso = comunicado.novoComunicado('IBS', 'Inclusao bem sucedida', 'Incluido com sucesso').object;
    return res.status(201).json(sucesso);
}
const recuperaCrime = async (req)
module.exports = { incluaCrime }