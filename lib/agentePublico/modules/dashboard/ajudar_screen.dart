import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruagramapp/agentePublico/modules/dashboard/dashboard_screen.dart';
import 'package:ruagramapp/agentePublico/modules/psr/menu_psr.dart';
import 'package:ruagramapp/geolocalizacaoUsuario.dart';
import 'package:ruagramapp/telaAviso.dart';

class AjudarScreen extends StatelessWidget {
  final controllerDoacao = TextEditingController();
  final controllerTelefone = TextEditingController();
  final controllerNome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (AppBar(
          iconTheme: IconThemeData(
            color: Colors.purple, //change your color here
          ),
          centerTitle: true,
          title: Text(
            "Ajudar",
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
        )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/handle.png",
                height: 150,
                width: 150,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Ajude uma pessoa em situação de rua!",
                  style: TextStyle(fontFamily: "QuickSand", fontSize: 20),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      "Envie-nos uma solicitação de coleta, listando os itens que deseja doar. Dessa forma, um agente da prefeitura irá até a sua localização para fazer a retirada.",
                      style: TextStyle(
                          fontFamily: "QuickSand",
                          fontSize: 14,
                          color: Colors.black87))),
              Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "Descreva sua doação",
                                style: TextStyle(fontFamily: "QuickSand"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "essa opção não está disponível para profissionais",
                                style: TextStyle(
                                    fontFamily: "QuickSand", fontSize: 10),
                              ),
                            ),
                            TextField(
                              autofocus: false,
                              maxLines: 6,
                              controller: controllerDoacao,
                              decoration: InputDecoration(
                                labelText: "O que deseja doar ?",
                                border: InputBorder.none,
                                icon: Icon(Icons.card_giftcard),
                              ),
                            ),
                            ExpansionTile(
                              title: Text("Seus Dados"),
                              children: [
                                Card(
                                  child: Column(
                                    children: [
                                      TextField(
                                        autofocus: false,
                                        maxLines: 1,
                                        controller: controllerNome,
                                        decoration: InputDecoration(
                                          labelText: "Nome",
                                          border: InputBorder.none,
                                          icon: Icon(Icons.person_outline),
                                        ),
                                      ),
                                      TextField(
                                        keyboardType: TextInputType.number,
                                        autofocus: false,
                                        maxLines: 1,
                                        controller: controllerTelefone,
                                        decoration: InputDecoration(
                                          labelText: "Telefone",
                                          border: InputBorder.none,
                                          icon: Icon(Icons.call),
                                        ),
                                      ),
                                    ],
                                  ),
                                  elevation: 5,
                                ),
                              ],
                            ),
                            OutlineButton(
                              hoverColor: Colors.white,
                              highlightColor: Colors.white70,
                              highlightElevation: 10,
                              child: Text('Enviar Solicitação'),
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.white30)),
                              // callback when button is clicked
                              borderSide: BorderSide(
                                color: Colors.blueGrey, //Color of the border
                                style: BorderStyle.solid, //Style of the border
                                width: 0.8, //width of the border
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
