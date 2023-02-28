import 'package:flutter/material.dart';

//Caminhos
String imgBackground = 'assets/menu_background.jpg';

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
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: login,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'login',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                TextFormField(
                  controller: senha,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'senha',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: OutlinedButton(
                      onPressed: () {
                        /*
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const HorarioPage()),
                      )
                      */
                        debugPrint('Clicou');
                      },
                      child: Text('entrar com login do SIGA')),
                )
              ],
            )));
  }
}
