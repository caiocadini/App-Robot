import 'package:flutter/material.dart';

//Caminhos
String imgBackground = 'assets/menu_background.jpg';

class CalendarioPage extends StatelessWidget {
  const CalendarioPage({super.key});

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
          body: Column(),
        ));
  }
}
