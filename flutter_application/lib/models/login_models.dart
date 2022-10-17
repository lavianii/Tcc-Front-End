import 'dart:convert';

import 'package:flutter_application/components/tela_inicial.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginModels {
 Iterable<dynamic> usuario= [];

  static Future<bool> saveString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static Future<bool> saveMap(String key, Map<String, dynamic> value) async {
    return saveString(key, jsonEncode(value));
  }

  static Future<String> getString(String key,
      [String defaultString = '']) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key) ?? defaultString;
  }

    saveList(Iterable user) async {
      
     usuario = user;
     print('save $usuario');
    
  }
   Future<Iterable> getList() async {
    print('gettiii $usuario');
    return usuario;
   }



  static Future<Map<String, dynamic>> getMap(String key) async {
    try {
      return jsonDecode(await getString(key));
    } catch (_) {
      return {};
    }
  }

  
}
