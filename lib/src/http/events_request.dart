import 'package:http/http.dart' as http;
import 'dart:convert';

class Evento {
  String titulo; //? para informar que o valor de titulo pode ser nulo
  String dia;
  String descricao;
  String local;

  Evento(
      {required this.titulo,
      required this.dia,
      required this.descricao,
      required this.local});

  factory Evento.fromJson(Map<String, dynamic> json) {
    return Evento(
      titulo: json['Titulo'],
      dia: json['Data'],
      descricao: json['Descricao'],
      local: json['Local'],
    );
  }
}

Future<List<Evento>> fetchResponse() async {
  final resposta = await http.get(Uri.parse(
      'https://api.dc.ufscar.br/api/eventos?_sort=Data:desc&_limit=10'));

  List<Evento> listaRetorno = [];
  if (resposta.statusCode == 200) {
    final jsonObject = await jsonDecode(resposta.body);
    
    for (var jsonData in jsonObject) {
      listaRetorno.add(Evento.fromJson(jsonData));
    }

    List<Evento> filtered = [];
    filtered.addAll(listaRetorno);
    filtered.retainWhere((element) {
      return DateTime.parse(element.dia).isAfter(DateTime.now());
    });
    
    return filtered;
  } else {
    throw Exception('Failed to obtain information');
  }
}
