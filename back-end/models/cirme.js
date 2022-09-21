class Crime {
    #id
    #bairro
    #tipoCrime

    constructor(id, bairro, tipoCrime) {
        this.#id = id;
        this.#bairro = bairro;
        this.#tipoCrime = tipoCrime;
    }

    get id() {
        return this.#id;
    }
    get bairro() {
        return this.#bairro;
    }
    get tipoCrime() {
        return this.#tipoCrime;
    }

    set id(id) {
        if (id === undefined || typeof id !== "number" || id === null) {
            throw ('Id inválido !');
        }
        this.#id = id;
    }

    set bairro(bairro) {
        if (bairro === undefined || typeof bairro !== "string" || bairro === '') {
            throw ('Bairro inválido !');
        }

        this.#bairro = bairro;
    }

    set tipoCrime(tipoCrime) {
        if (tipoCrime === undefined || typeof tipoCrime !== "string" || tipoCrime === '') {
            throw ('Tipo do crime inválido !');
        }

        this.#tipoCrime = tipoCrime;
    }
}

const novoCrime = (id, bairro, tipoCrime) => {

    return new Crime(id, bairro, tipoCrime);

}

module.exports = { novoCrime }