import 'package:app_robo/navigation_message.dart';
import 'package:flutter/material.dart';

String imgBackground = 'assets/menu_background.jpg';

class NavegacaoPage extends StatelessWidget {
  const NavegacaoPage({super.key});

  Widget boxCreation(String texto, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          fetchNavigationResponse(texto);
        },
        child: Container(
          height: 120 / 800 * MediaQuery.of(context).size.height,
          width: 30 / 1290 * MediaQuery.of(context).size.width,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 37, 35, 42)),
          child: Center(
            child: Text(texto),
          ),
        ),
      ),
    );
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
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.of(context).maybePop(context),
                icon: const Icon(Icons.arrow_back, color: Colors.white)),
            backgroundColor: Colors.white.withOpacity(0),
            elevation: 0.0,
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              boxCreation('LE-1', context),
              boxCreation('LE-2', context),
              boxCreation('LE-3', context),
              boxCreation('LE-4', context),
              boxCreation('Suporte', context),
              boxCreation('PPG-CC4', context),
              boxCreation('Maker', context),
              boxCreation('LE-5', context),
              boxCreation('Auditorio', context),
              boxCreation('Banheiros', context),
              boxCreation('Copa', context),
              boxCreation('Lig', context),
              boxCreation('Reunioes', context),
              boxCreation('Chefia', context),
              boxCreation('Graduacao', context),
              boxCreation('Recepcao', context),
              boxCreation('Home', context),
            ],
          ),
        ));
  }
}
