class Usuario {
    #nomeUsuario
    #senha
    #email

    constructor(nomeUsuario, senha, email) {
        this.#nomeUsuario = nomeUsuario;
        this.#senha = senha;
        this.#email = email;
    }

    get nomeUsuario() {
        return this.#nomeUsuario;
    }

    get senha() {
        return this.#senha;
    }

    get email() {
        return this.#email;
    }


    set nomeUsuario(nomeUsuario) {
        if (nomeUsuario === undefined || typeof nomeUsuario !== "string" || nomeUsuario === '') {
            throw ('Nome de usuário inválido !');
        }
        this.#nomeUsuario = nomeUsuario;
    }

    set senha(senha) {

        if (senha === undefined || typeof senha !== 'string' || senha === '') {
            throw ('Senha inválida !');
        }
        this.#senha = senha;
    }

    set email(email){
        if(email === undefined || typeof email !== 'string' || email === ''){
            throw('email inválido !')
        }
    }

}

const novoUsuario= (nomeUsuario, senha, email) => {
    
    let novoUsuario = new Usuario (nomeUsuario, senha, email);

    return novoUsuario;
}

module.exports = { novoUsuario }