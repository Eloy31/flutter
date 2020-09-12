import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?format=json&key=<chave>";

class Requisicao {
  Future<Map> getDados() async {
    http.Response response = await http.get(request);
    return json.decode(response.body);
  }
}
