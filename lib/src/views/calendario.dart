import 'package:app_robo/src/components/cards/elevated_card.dart';
import 'package:flutter/material.dart';
import 'package:app_robo/src/http/events_request.dart';
import 'package:intl/intl.dart';
// import 'package:intl/date_symbol_data_local.dart';

String imgBackground = 'assets/menu_background.jpg';
String imgMateria = 'assets/media.png';

// CALENDÁRIO//
class CalendarioPage extends StatefulWidget {
  const CalendarioPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return CalendarioPageState();
  }
}

class CalendarioPageState extends State<CalendarioPage> {
  final df = DateFormat('dd/MM/yyyy');
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
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const Text(
                  'Eventos do DC',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                //const SegmentedButtonSingleChoice(values: []),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder<List<Evento>>(
                        future: fetchResponse(),
                        builder: (context, dados) {
                          if (dados.data == null) {
                            return const Center(
                                child: Text('Carregando...',
                                    style: TextStyle(
                                      color: Colors.white,
                                    )));
                          } else {
                            List<Evento> eventos = dados.data as List<Evento>;
                            if (eventos.isEmpty) {
                              return const Center(
                                child: Text('Parece que ainda não há nenhum evento marcado...\nVolte outro dia!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic
                                  ),
                                )
                              );
                            }
                            return ListView.builder(
                              itemCount: eventos.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                Evento evento = eventos[index];
                                return ElevatedCard(
                                  title: evento.titulo,
                                  subTitle: evento.descricao,
                                  // cardText: evento.descricao,
                                  cardText: "${DateFormat.yMd('pt_BR').format(DateTime.parse(evento.dia)).toString()} - ${DateFormat.Hm().format(DateTime.parse(evento.dia)).toString()} ${evento.local}",
                                  height: 180,
                                  width: 160,
                                );
                              });
                          }
                        },
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
