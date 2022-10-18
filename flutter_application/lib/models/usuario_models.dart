class Usuario {
  int id;
  String senha;
  String nome;
  String email;

  Usuario(
    this.id,
    this.senha,
    this.email,
    this.nome,
  );

  Map toJson() => {'id': id, 'senha': senha, 'email': email};

  factory Usuario.fromJson(dynamic json) {
    if (json['id'] == null) json['id'] = '';
    if (json['senha'] == null) json['senha'] = '';
    if (json['email'] == null) json['email'] = '';
    if (json['nome'] == null) json['nome'] = '';

    return Usuario(json['id'], json['senha'], json['email'], json['nome']);
  }

  @override
  String toString() {
    return '{$id,$senha,$email,$nome}';
  }
}
