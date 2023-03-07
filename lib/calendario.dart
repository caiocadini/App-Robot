import 'package:flutter/material.dart';
import 'event_info.dart';

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
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
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
                            return ListView.builder(
                                itemCount: eventos.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  Evento evento = eventos[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: (60 /
                                          800 *
                                          MediaQuery.of(context).size.height),
                                      width: (250 /
                                          1290 *
                                          MediaQuery.of(context).size.width),
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 37, 35, 42),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: ListView(
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0,
                                                  top: 2.0,
                                                  left: 2.0),
                                              child: SizedBox(
                                                child: Center(
                                                  child: Text(
                                                    evento.titulo,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Raleway',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          /*
                                          Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              imgMateria,
                                            ),
                                          ),
                                          */
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0,
                                                left: 2.0,
                                                bottom: 8.0),
                                            child: Text(evento.dia,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontFamily: 'Raleway',
                                                )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 2.0,
                                            ),
                                            child: Text(evento.local,
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }
                          ;
                        },
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
