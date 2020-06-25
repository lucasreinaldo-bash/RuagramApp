import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'models/user_model.dart';

class PerfildoAnjo extends StatelessWidget {
  List<String> galeriaImages = new List();
  CarouselSlider instance;
  List cidadeEstado;

  String nomeCompleto,
      imagem,
      localizacaoFrequente,
      apelido,
      cadUnico,
      dataNascimento,
      doencas,
      escolaridade,
      idoso,
      profissionalResponsavel,
      sexo,
      sus;
  List galeriaPagina;

  UserModel user;
  PerfildoAnjo(
      @required this.nomeCompleto,
      @required this.imagem,
      @required this.localizacaoFrequente,
      @required this.apelido,
      @required this.cadUnico,
      @required this.cidadeEstado,
      @required this.dataNascimento,
      @required this.doencas,
      @required this.escolaridade,
      @required this.idoso,
      @required this.profissionalResponsavel,
      @required this.sexo,
      @required this.sus);

  @override
  void initState() {
    print(galeriaPagina);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/fundo_card.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: null /* add child content content here */,
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 90),
                child: Center(
                    child: Card(
                  elevation: 40,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(100.0),
                      side: BorderSide(color: Colors.white30)),
                  child: Container(
                      width: 180.0,
                      height: 180.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(imagem),
                          ))),
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                nomeCompleto,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Conhecido por: " + apelido,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Sua localização mais frequente é: " + localizacaoFrequente,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black38),
              ),
              SizedBox(
                height: 60,
              ),
              Card(
                elevation: 4,
                child: ExpansionTile(
                  title: Text("Dados Médicos"),
                  children: [
                    ListTile(
                      title: Text("Doenças Diagnósticadas: " + doencas),
                      leading: Icon(Icons.healing),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 4,
                child: ExpansionTile(
                  title: Text("Ficha Completa"),
                  children: [
                    Column(
                      children: [
                        ListTile(
                          title: Text("Nível de Escolaridade: " + escolaridade),
                          leading: Icon(Icons.school),
                        ),
                        ListTile(
                          title: Text("Data de Nascimento: " + dataNascimento),
                          leading: Icon(Icons.child_care),
                        ),
                        ListTile(
                          title: Text("Idoso: " + idoso),
                          leading: Icon(Icons.person_outline),
                        ),
                        ListTile(
                          title: Text("Data de Nascimento: " + dataNascimento),
                          leading: Icon(Icons.child_care),
                        ),
                        ListTile(
                          title: Text("Cartão do SUS: " + sus),
                          leading: Icon(Icons.credit_card),
                        ),
                        ListTile(
                          title: Text("Cartão do CAD Unico: " + cadUnico),
                          leading: Icon(Icons.credit_card),
                        ),
                        ListTile(
                          title: Text(
                              "Profissional responsável pelo cadastro: " +
                                  profissionalResponsavel),
                          leading: Icon(Icons.person),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                child: InkWell(
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_return,
                      color: Colors.green.shade600,
                    ),
                  ),
                  onTap: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
