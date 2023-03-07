import 'dart:ffi';
import 'package:app_robo/navigation_message.dart';

import 'navegacao.dart';
import 'package:app_robo/calendario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'informacoes.dart';

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
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const HomePage(title: 'Flutter Demo Home Page'),
      );
    });
  }
}

//Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key, required String title});

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const CalendarioPage()),
                            );
                          },
                          child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color.fromARGB(255, 37, 35, 42),
                              ),
                              height: 10.h,
                              width: 30.w,
                              child: const Center(
                                child: Text(
                                  'Evento',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const NavegacaoPage()),
                            );
                          },
                          child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color.fromARGB(255, 37, 35, 42),
                              ),
                              height: 10.h,
                              width: 30.w,
                              child: const Center(
                                child: Text(
                                  'Explorar o DC',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                        Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color.fromARGB(255, 37, 35, 42),
                            ),
                            height: 10.h,
                            width: 30.w,
                            child: const Center(
                              child: Text(
                                'Xadrez',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color.fromARGB(255, 37, 35, 42),
                            ),
                            height: 10.h,
                            width: 30.w,
                            child: const Center(
                              child: Text(
                                'Grupos de Extensão',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const InfoPage()),
                            );
                          },
                          child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color.fromARGB(255, 37, 35, 42),
                              ),
                              height: 10.h,
                              width: 30.w,
                              child: const Center(
                                child: Text(
                                  'Informações',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                        Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color.fromARGB(255, 37, 35, 42),
                            ),
                            height: 10.h,
                            width: 30.w,
                            child: const Center(
                              child: Text(
                                'Configurações',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ],
                    )
                  ],
                ))));
  }
}
