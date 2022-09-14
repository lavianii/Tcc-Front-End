class Usuario {
    #id
    #nome
    #senha
    #email

    constructor(id, nome, senha, email) {
        this.#id = id;
        this.#nome = nome;
        this.#senha = senha;
        this.#email = email;
    }
    get id() {
        return this.#id;
    }
    get nome() {
        return this.#nome;
    }

    get senha() {
        return this.#senha;
    }

    get email() {
        return this.#email;
    }

    set id(id) {
        if(id === undefined || typeof id  !== "number" || id === null){
            throw('Id inválido !');
        }
        this.#id = id;
    }

    set nome(nome) {
        if (nome === undefined || typeof nome !== "string" || nome === '') {
            throw ('Nome de usuário inválido !');
        }
        this.#nome = nome;
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

const novoUsuario= (id, nome, senha, email) => {
    
    let novoUsuario = new Usuario (id, nome, senha, email);

    return novoUsuario;
}

module.exports = { novoUsuario }