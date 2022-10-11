class Bairro{
  int id;
  String bairro;
  String tipoCrime;
  int qtd ;
  String data;

  Bairro(
    this.id,
    this.bairro,
    this.qtd,
    this.tipoCrime,
    this.data,
  );

  Map toJson() => {'id': id, 'bairro': bairro, 'qtd': qtd,'tipoCrime':tipoCrime, 'data': data};

  factory Bairro.fromJson(dynamic json) {

     if (json['data'] == null) json['data'] = '';

    return Bairro(json['id'], json['bairro'], json['qtd'],json['tipoCrime'],json['data']);
  }

  @override
  String toString() {
    return '{${this.id},${this.bairro},${this.qtd},${this.data},${this.tipoCrime}}';
  }
}