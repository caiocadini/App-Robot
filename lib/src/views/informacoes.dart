import 'package:flutter/material.dart';

//Caminhos
String imgBackground = 'assets/menu_background.jpg';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imgBackground), fit: BoxFit.cover),
        ),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.of(context).maybePop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.white)),
            backgroundColor: Colors.white.withOpacity(0),
            elevation: 0.0,
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
                height: (664 / 800 * MediaQuery.of(context).size.height),
                width: (1150 / 1280 * MediaQuery.of(context).size.width),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 37, 35, 42),
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Sobre mim e o meu sistema!',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Text(
                        'Olá, eu sou o robô do DC, estou aqui para lhe ajudar em tudo que foi necessário. Você pode consultar eventos que irão acontecer no departamento e explorar o mapa do DC, espero que você se divirta',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // ignore: prefer_const_literals_to_create_immutables
                      child: Column(children: [
                        const Center(
                          child: Text('Alunos:'),
                        ),
                        const Text('Caio Cadini'),
                        const Text('Rodrigo Coffani'),
                        const Text('Lucca Couto'),
                        const Text('Lucas Abbiati'),
                        const Text('Heitor Colichio')
                      ]),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
