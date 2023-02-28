import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

//Caminhos
String imgBackground = 'assets/menu_background.jpg';
String imgMateria = 'assets/media.png';
/*
/*
class Horarios {
  final String dia;
  final String horaInicio;
  final String horaFinal;
  final String sala;

  Horarios({
    required this.dia,
    required this.horaInicio,
    required this.horaFinal,
    required this.sala,
  });

  factory Horarios.fromJson(Map<String, dynamic> parsedJson) {
    return Horarios(
        dia: parsedJson['dia'],
        horaInicio: parsedJson['inicio'],
        horaFinal: parsedJson['fim'],
        sala: parsedJson['sala']);
  }
}

class Materia {
  final dynamic id;
  final dynamic nome;
  final List<Horarios> horarios;

  Materia({
    required this.id,
    required this.nome,
    required this.horarios,
  });

  factory Materia.fromJson(Map<String, dynamic> json) {
    return Materia(
      id: json["id"],
      nome: json['atividade'],
      horarios: parseHorarios(json),
    );
  }

  static List<Horarios> parseHorarios(horariosJson) {
    var list = horariosJson['horarios'] as List;
    List<Horarios> horariosList =
        list.map((data) => Horarios.fromJson(data)).toList();
    return horariosList;
  }
}

class Data {
  final List<dynamic> data;

  Data({
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(data: json['data']);
  }
  /*
  static List<Materia> parseMaterias(materiasJson) {
    var list = materiasJson['id'] as List;
    List<Materia> materiasList =
        list.map((data) => Materia.fromJson(data)).toList();
    return materiasList;
  }
  */
}
*/
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.data,
  });
  List<Datum> materiaDia(String diaSemana) {
    List<Datum> materias = [];
    for (var element in data) {
      if (element.temAula(diaSemana) == true) {
        materias.add(element);
      }
    }
    return materias;
  }

  List<Datum> data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.atividade,
    required this.turma,
    required this.periodo,
    required this.ano,
    required this.horarios,
  });

  int id;
  String atividade;
  String turma;
  int periodo;
  int ano;
  List<Horario> horarios;

  String get getNome {
    return atividade;
  }

  bool temAula(String diaSemana) {
    bool inicio = false;
    for (var element in horarios) {
      if (element.dia == diaSemana) {
        inicio = true;
      }
    }
    return inicio;
  }

  String aulaComeco(String diaSemana) {
    for (var element in horarios) {
      if (element.dia == diaSemana) {
        return element.getInicio;
      }
    }
    return ('Horário');
  }

  String aulaFim(String diaSemana) {
    for (var element in horarios) {
      if (element.dia == diaSemana) {
        return element.getFim;
      }
    }
    return ('Horário');
  }

  String sala(String diaSemana) {
    for (var element in horarios) {
      if (element.dia == diaSemana) {
        return element.sala;
      }
    }
    return ('Sala');
  }

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        atividade: json["atividade"],
        turma: json["turma"],
        periodo: json["periodo"],
        ano: json["ano"],
        horarios: List<Horario>.from(
            json["horarios"].map((x) => Horario.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "atividade": atividade,
        "turma": turma,
        "periodo": periodo,
        "ano": ano,
        "horarios": List<dynamic>.from(horarios.map((x) => x.toJson())),
      };
}

class Horario {
  Horario({
    required this.dia,
    required this.inicio,
    required this.fim,
    required this.sala,
  });

  String dia;
  String inicio;
  String fim;
  String sala;

  String get getInicio {
    return inicio;
  }

  String get getFim {
    return fim;
  }

  factory Horario.fromJson(Map<String, dynamic> json) => Horario(
        dia: json["dia"],
        inicio: json["inicio"],
        fim: json["fim"],
        sala: json["sala"],
      );

  Map<String, dynamic> toJson() => {
        "dia": dia,
        "inicio": inicio,
        "fim": fim,
        "sala": sala,
      };
}

Future<Welcome> fetchResponse(login, senha) async {
  String credenciais = (login + ':' + senha);
  String codificada = base64.encode(utf8.encode(credenciais));
  final response = await http.get(
    Uri.parse('https://sistemas.ufscar.br/sagui-api/siga/deferimento'),
    // Send authorization headers to the backend.
    headers: {
      HttpHeaders.authorizationHeader: 'Basic $codificada',
    },
  );

  if (response.statusCode == 200) {
    final jsonObjetc = await jsonDecode(response.body);
    Welcome dados = Welcome.fromJson(jsonObjetc);
    for (var element in dados.data) {
      print(element.id);
    }
    return dados;
  } else {
    throw Exception('Failed to fetch');
  }
}
/*
class Album {
  final List<String> materias;
  final List<String> salas;
  final List<String> dias;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
*/
*/

// LOGIN //
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  //Controladores
  TextEditingController login = TextEditingController();
  TextEditingController senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imgBackground), fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => Navigator.of(context).maybePop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white)),
              backgroundColor: Colors.white.withOpacity(0),
              elevation: 0.0,
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: login,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'login',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    TextFormField(
                      controller: senha,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'senha',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          onPressed: () async {
                            //dados = await fetchResponse(login.text, senha.text);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CalendarioPage()));
                          },
                          child: const Text(
                            'entrar com login do SIGA',
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            )));
  }
}

// CALENDÁRIO//
class CalendarioPage extends StatefulWidget {
  const CalendarioPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return CalendarioPageState();
  }
}

class CalendarioPageState extends State<CalendarioPage> {
  Widget caixaMateria() {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
            height: (60 / 800 * MediaQuery.of(context).size.height),
            width: (250 / 1290 * MediaQuery.of(context).size.width),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 37, 35, 42),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.0, top: 2.0, left: 2.0),
                    child: Text(
                      'Horário',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    imgMateria,
                    //width: (108 / 1280 * MediaQuery.of(context).size.width),
                    //height: (60 / 800 * MediaQuery.of(context).size.height)
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 2.0, bottom: 8.0),
                  child: Text('Matéria', style: TextStyle(color: Colors.white)),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 2.0,
                  ),
                  child: Text('Sala', style: TextStyle(color: Colors.white)),
                ),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    //aulas = widget.dados.materiaDia('SEGUNDA');
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imgBackground), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.of(context).maybePop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.white)),
            backgroundColor: Colors.white.withOpacity(0),
            elevation: 0.0,
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  height: (70 / 800 * MediaQuery.of(context).size.height),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topCenter,
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          height:
                              (40 / 800 * MediaQuery.of(context).size.height),
                          width:
                              (108 / 1280 * MediaQuery.of(context).size.width),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 37, 35, 42),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: const Center(
                            child: Text('Segunda',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          height:
                              (40 / 800 * MediaQuery.of(context).size.height),
                          width:
                              (108 / 1280 * MediaQuery.of(context).size.width),
                          color: const Color.fromARGB(255, 37, 35, 42),
                          child: const Center(
                            child: Text('Terça',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          height:
                              (40 / 800 * MediaQuery.of(context).size.height),
                          width:
                              (108 / 1280 * MediaQuery.of(context).size.width),
                          color: const Color.fromARGB(255, 37, 35, 42),
                          child: const Center(
                            child: Text('Quarta',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          height:
                              (40 / 800 * MediaQuery.of(context).size.height),
                          width:
                              (108 / 1280 * MediaQuery.of(context).size.width),
                          color: const Color.fromARGB(255, 37, 35, 42),
                          child: const Center(
                            child: Text('Quinta',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          height:
                              (40 / 800 * MediaQuery.of(context).size.height),
                          width:
                              (108 / 1280 * MediaQuery.of(context).size.width),
                          color: const Color.fromARGB(255, 37, 35, 42),
                          child: const Center(
                            child: Text('Sexta',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          height:
                              (40 / 800 * MediaQuery.of(context).size.height),
                          width:
                              (108 / 1280 * MediaQuery.of(context).size.width),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 37, 35, 42),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: const Center(
                            child: Text('Sábado',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          caixaMateria(),
                          caixaMateria(),
                          caixaMateria(),
                          caixaMateria(),
                          caixaMateria(),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
