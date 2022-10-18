
// ignore_for_file: avoid_print



class LoginModels {
  Iterable<dynamic> usuario = [];

  saveUsuario(Iterable user) async {

    if(user.isEmpty){
      throw ('usuario vazio');
    }
      usuario = user;
 
  }

  Future<Iterable> getUsuario() async {
   if(usuario.isEmpty){
      throw ('usuario vazio');
    }
    return usuario;
  }
}
