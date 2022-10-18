class Usuario{
 
  int id;
  String senha;
  String email;

  Usuario(
    this.id,
    this.senha,
    this.email,

  
  );

  Map toJson() => { 'id': id,'senha': senha,'email':email};

  factory Usuario.fromJson(dynamic json) {

      if (json['id'] == null) json['id'] = '';
      if (json['senha'] == null) json['senha'] = '';
      if (json['email'] == null) json['email'] = '';

    return Usuario(json['id'] ,json['senha'],json['email']);
  }

  @override
  String toString() {
    return '{$id,$senha,$email}';
  }
}