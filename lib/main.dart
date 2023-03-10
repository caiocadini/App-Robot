import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:app_robo/src/views/navegacao.dart';
import 'package:app_robo/src/views/calendario.dart';
import 'package:app_robo/src/views/informacoes.dart';
import 'package:app_robo/src/components/cards/elevated_card.dart';

//Caminhos
String imgBackground = 'assets/menu_background.jpg';

void main() {
  runApp(const MyApp());
}

//Widget Principal
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //Orientação landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Aplicação Robô',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.indigo,
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const HomePage(title: 'Flutter Demo Home Page'),
      );
    });
  }
}

//Home Page
class HomePage extends StatefulWidget {
  const HomePage({super.key, required String title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('pt_BR')
        .then((value) => debugPrint(Intl.getCurrentLocale()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imgBackground), fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'Olá, visitante!',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Text(
                          'Com o que posso te ajudar?',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedCard(
                          cardText: 'Eventos',
                          onTap: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const CalendarioPage()),
                            )
                          },
                        ),
                        ElevatedCard(
                          cardText: 'Explorar o DC',
                          onTap: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const NavegacaoPage()),
                            )
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedCard(
                          cardText: 'Informações',
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const InfoPage()),
                          ),
                        ),
                      ],
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     FloatingActionButton.extended(
                    //       onPressed: () => debugPrint('Ver mais'),
                    //       label: const Text('Ver mais'),
                    //       icon: const Icon(Icons.expand_more, size: 14),
                    //       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(200))),
                    //       extendedTextStyle: const TextStyle(
                    //         fontSize: 12
                    //       ),
                    //     )
                    //   ],
                    // )
                  ],
                ))));
  }
}
