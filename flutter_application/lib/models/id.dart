class Id{
 
  String id;



  Id(

    this.id,

  );

  Map toJson() => { 'id': id};

  factory Id.fromJson(dynamic json) {

 

    return Id( json['id']);
  }

  @override
  String toString() {
    return '{${this.id}}';
  }
}