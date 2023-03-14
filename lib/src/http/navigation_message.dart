import 'package:http/http.dart' as http;
import 'dart:convert';

//Lista de locais
class Locais {
  List<String> availableLocals;

  Locais({required this.availableLocals});

  factory Locais.fromJson(Map<String, dynamic> json) {
    return Locais(availableLocals: json['available_locals'].cast<String>());
  }
}

//Pedir para a API uma lista com todos os locais possíveis de se visitar no DC
Future<Locais> fetchLocais() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.202:5000/ros/goal'));

  final respostaJson = jsonDecode(response.body);
  final retorno = Locais.fromJson(respostaJson);

  for (var local in retorno.availableLocals) {
    print(local);
  }

  return retorno;
}

//Classe para a resposta de deslocamento
class Resposta {
  String? resultado;

  Resposta({this.resultado});

  factory Resposta.fromJson(Map<String, dynamic> json) {
    return Resposta(resultado: json['result']);
  }
}

//Retorno da resposta para navegação
Future<Resposta> fetchNavigationResponse(String local) async {
  final response =
      await http.get(Uri.parse('http://192.168.1.202:5000/ros/goTo/$local'));

  final jsonResponse = jsonDecode(response.body);
  final resultado = Resposta.fromJson(jsonResponse);
  print(resultado);

  return resultado;
}
