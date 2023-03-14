import 'package:app_robo/src/http/navigation_message.dart';
import 'package:image/image.dart' as IMG;
import 'package:flutter/material.dart';
import 'package:diacritic/diacritic.dart';

String imgBackground = 'assets/menu_background.jpg';
String imgMap = 'assets/MapaPisoTerreo2022.jpg';

String ligMessage =
    'Esse é o Laboratório de Informática Geral, um lugar perfeito para estudar e usar os computadores do departamento. Ele fica LIGado 24/7 !!!';
String makerMessage =
    'O Espaço Maker é a mais nova sala inaugurada no DC, seu objetivo está em permitir o desenvolvimento de novas habilidades por parte dos alunos dando maior ênfase na prática e no desenvolvimento de projetos';
String leMessage =
    'Um dos Laboratórios de Ensino espalhados pelo DC, seu uso principal é voltado para aulas de teor mais prático, permitindo o uso das máquinas presentes nessas salas para botar a mão na massa e codar!!!';
String banheiroMessage = 'Banheiros do DC';
String auditorioMessage =
    'Aqui no auditório do DC são realizados os eventos mais variados, desde aulas à palestras voltadas para um público mais aberto. É provável que muitos dos eventos que você pode consultar em minha aba de eventos ocorram aqui!';
String copaMessage =
    'Na copa do DC você pode comprar sua bebida ou alguma comida nas maquininhas de venda, ou socializar com outros alunos na região da cafeteira do DC ;)';
String recepcaoMessage =
    'Esta é a recepção do DC, junto dela está a caixa de achados e perdidos do departamento. Se algo seu sumiu, a melhor ideia seria começar a procurar por aqui';
String saguaoMessage =
    'Bem vindo ao saguão do DC! Este é o ponto de partida para sua exploração do departamento, na dúvida de qualquer coisa é só falar comigo :))';
String ppgMessage =
    'Essa é a sala cuja utilização é dedicada aos estudantes de pós-graduação, mesmo assim, ainda é possível que os estudantes da graduação tenham aulas e até mesmo reuniões nestas salas';
String apoioMessage =
    'Essa sala visa a organização de eventos que buscam o apoio emocional e psicológico dos estudantes, como os plantẽos psicanalíticos. Lembre-se, a faculdade pode parecer impossível as vezes, porém se abrir com alguém pode ajudar a aliviar o peso ;)';
String chefiaMessage = 'Essa é a sala da chefia do departamento';
String reunioesMessage = 'Sala de reuniões do DC';

class NavegacaoPage extends StatelessWidget {
  const NavegacaoPage({super.key});

  Widget boxCreation(String texto, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          fetchNavigationResponse(texto);
        },
        child: FilledButton(
          onPressed: () {
            fetchNavigationResponse(removeDiacritics(texto));
          },
          child: Text('Ir até $texto'),
        ),
      ),
    );
  }

  Widget iconInteractor(String texto, BuildContext context, String message) {
    return InkWell(
        onTap: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      texto.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(child: Text(message)),
                    ),
                    boxCreation(texto, context),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Voltar'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: Icon(
          Icons.location_on,
          color: Colors.black,
          size: 50 / 1280 * MediaQuery.of(context).size.width,
        ));
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
              title: const Text(
                'Explorar o DC',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              bottom: const PreferredSize(
                preferredSize: Size.zero,
                child: Text(
                    'Selecione algum marcador para ver mais informações sobre o local'),
              ),
              elevation: 0.0,
            ),
            body: InteractiveViewer(
              constrained: false,
              child: Stack(
                children: [
                  Image(
                      image: ResizeImage(AssetImage(imgMap),
                          width:
                              (1280 / 1280 * MediaQuery.of(context).size.width)
                                  .round(),
                          height:
                              (800 / 800 * MediaQuery.of(context).size.height)
                                  .round())),
                  Positioned(
                    top: 280 / 800 * MediaQuery.of(context).size.height,
                    right: 130 / 1280 * MediaQuery.of(context).size.width,
                    child: iconInteractor('LIG', context, ligMessage),
                  ),
                  Positioned(
                      bottom: 200 / 800 * MediaQuery.of(context).size.height,
                      left: 450 / 1280 * MediaQuery.of(context).size.width,
                      child: iconInteractor('Maker', context, makerMessage)),
                  Positioned(
                    bottom: 200 / 800 * MediaQuery.of(context).size.height,
                    right: 130 / 1280 * MediaQuery.of(context).size.width,
                    child: iconInteractor('LE-1', context, leMessage),
                  ),
                  Positioned(
                    bottom: 200 / 800 * MediaQuery.of(context).size.height,
                    right: 250 / 1280 * MediaQuery.of(context).size.width,
                    child: iconInteractor('LE-2', context, leMessage),
                  ),
                  Positioned(
                    bottom: 200 / 800 * MediaQuery.of(context).size.height,
                    right: 350 / 1280 * MediaQuery.of(context).size.width,
                    child: iconInteractor('LE-3', context, leMessage),
                  ),
                  Positioned(
                    bottom: 200 / 800 * MediaQuery.of(context).size.height,
                    right: 460 / 1280 * MediaQuery.of(context).size.width,
                    child: iconInteractor('LE-4', context, leMessage),
                  ),
                  Positioned(
                    bottom: 200 / 800 * MediaQuery.of(context).size.height,
                    left: 300 / 1280 * MediaQuery.of(context).size.width,
                    child: iconInteractor('LE-5', context, leMessage),
                  ),
                  Positioned(
                    bottom: 370 / 800 * MediaQuery.of(context).size.height,
                    right: 650 / 1280 * MediaQuery.of(context).size.width,
                    child:
                        iconInteractor('Banheiros', context, banheiroMessage),
                  ),
                  Positioned(
                    bottom: 350 / 800 * MediaQuery.of(context).size.height,
                    right: 120 / 1280 * MediaQuery.of(context).size.width,
                    child:
                        iconInteractor('Banheiros', context, banheiroMessage),
                  ),
                  Positioned(
                    bottom: 200 / 800 * MediaQuery.of(context).size.height,
                    left: 160 / 1280 * MediaQuery.of(context).size.width,
                    child:
                        iconInteractor('Auditório', context, auditorioMessage),
                  ),
                  Positioned(
                    top: 330 / 800 * MediaQuery.of(context).size.height,
                    right: 100 / 1280 * MediaQuery.of(context).size.width,
                    child: iconInteractor('Copa', context, copaMessage),
                  ),
                  Positioned(
                    top: 180 / 800 * MediaQuery.of(context).size.height,
                    left: 650 / 1280 * MediaQuery.of(context).size.width,
                    child: iconInteractor('Recepção', context, recepcaoMessage),
                  ),
                  Positioned(
                    top: 220 / 800 * MediaQuery.of(context).size.height,
                    left: 545 / 1280 * MediaQuery.of(context).size.width,
                    child: iconInteractor('Home', context, saguaoMessage),
                  ),
                  Positioned(
                    bottom: 200 / 800 * MediaQuery.of(context).size.height,
                    left: 545 / 1280 * MediaQuery.of(context).size.width,
                    child: iconInteractor('PPG-CC4', context, ppgMessage),
                  ),
                  Positioned(
                    bottom: 225 / 800 * MediaQuery.of(context).size.height,
                    left: 680 / 1280 * MediaQuery.of(context).size.width,
                    child: iconInteractor('Suporte', context, apoioMessage),
                  ),
                  Positioned(
                    top: 260 / 800 * MediaQuery.of(context).size.height,
                    left: 620 / 1280 * MediaQuery.of(context).size.width,
                    child: iconInteractor('Chefia', context, chefiaMessage),
                  ),
                  Positioned(
                    top: 260 / 800 * MediaQuery.of(context).size.height,
                    left: 770 / 1280 * MediaQuery.of(context).size.width,
                    child: iconInteractor('Reuniões', context, reunioesMessage),
                  )
                ],
              ),
            )));
  }
}
