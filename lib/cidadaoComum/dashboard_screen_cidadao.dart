import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ruagramapp/agentePublico/modules/dashboard/ajudar_screen.dart';
import 'package:ruagramapp/agentePublico/modules/psr/menu_psr.dart';
import 'package:ruagramapp/cidadaoComum/ajudar_screen_cidadao.dart';
import 'package:ruagramapp/geolocalizacaoUsuario.dart';
import 'package:ruagramapp/models/user_model.dart';
import 'package:ruagramapp/telaAviso.dart';

class DashboardScreenCidadao extends StatefulWidget {
  String cidadeEstado, endereco;

  DashboardScreenCidadao(this.cidadeEstado, this.endereco);
  @override
  _DashboardScreenCidadaoState createState() =>
      _DashboardScreenCidadaoState(this.cidadeEstado, this.endereco);
}

class _DashboardScreenCidadaoState extends State<DashboardScreenCidadao> {
  FirebaseUser firebaseUser;
  String cidadeEstado, endereco;
  _DashboardScreenCidadaoState(this.cidadeEstado, this.endereco);

  @override
  Widget build(BuildContext context) {
    print(cidadeEstado);
    print(endereco);
    String uid = UserModel.of(context).firebaseUser.uid;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            print("a");
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    AjudarScreenCidadao(cidadeEstado, endereco)));
          },
          child: Image.asset(
            "assets/handle.png",
            height: 40,
            width: 40,
          ),
        ),
        appBar: (AppBar(
          iconTheme: IconThemeData(
            color: Colors.purple, //change your color here
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Dashboard - Quantitativo",
            style: TextStyle(color: Colors.black87),
          ),
        )),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Card(
                      child: Container(
                        color: Colors.deepPurple,
                        height: 200,
                        width: 340,
                        child: (Padding(
                            padding:
                                EdgeInsets.only(top: 50, left: 40, right: 40),
                            child: Column(
                              children: [
                                Text(
                                  "População em Situação de Rua",
                                  style: TextStyle(
                                      fontFamily: "QuickSand",
                                      color: Colors.white),
                                ),
                                Text(
                                  "Localidade: " + cidadeEstado,
                                  style: TextStyle(
                                      fontFamily: "QuickSand",
                                      color: Colors.white70),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      FutureBuilder<QuerySnapshot>(
                                          future: Firestore.instance
                                              .collection("PopulacaoEmRua")
                                              .where("sexo",
                                                  isEqualTo: "Masculino")
                                              .getDocuments(),
                                          builder: (context, snapshot2) {
                                            if (!snapshot2.hasData) {
                                              CircularProgressIndicator();
                                            } else {
                                              return Column(
                                                children: [
                                                  Text(
                                                    snapshot2
                                                        .data.documents.length
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 40,
                                                        color: Colors.white,
                                                        fontFamily:
                                                            "QuickSand"),
                                                  ),
                                                  Text(
                                                    "Homens",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                        fontFamily:
                                                            "QuickSand"),
                                                  )
                                                ],
                                              );
                                            }
                                          }),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      FutureBuilder<QuerySnapshot>(
                                          future: Firestore.instance
                                              .collection("PopulacaoEmRua")
                                              .where("sexo",
                                                  isEqualTo: "Feminino")
                                              .getDocuments(),
                                          builder: (context, snapshot2) {
                                            if (!snapshot2.hasData) {
                                              CircularProgressIndicator();
                                            } else {
                                              return Column(
                                                children: [
                                                  Text(
                                                    snapshot2
                                                        .data.documents.length
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 40,
                                                        color: Colors.white,
                                                        fontFamily:
                                                            "QuickSand"),
                                                  ),
                                                  Text(
                                                    "Mulheres",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                        fontFamily:
                                                            "QuickSand"),
                                                  )
                                                ],
                                              );
                                            }
                                          }),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      FutureBuilder<QuerySnapshot>(
                                          future: Firestore.instance
                                              .collection("PopulacaoEmRua")
                                              .where("idosos", isEqualTo: "Sim")
                                              .getDocuments(),
                                          builder: (context, snapshot2) {
                                            if (!snapshot2.hasData) {
                                              CircularProgressIndicator();
                                            } else {
                                              return Column(
                                                children: [
                                                  Text(
                                                    snapshot2
                                                        .data.documents.length
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 40,
                                                        color: Colors.white,
                                                        fontFamily:
                                                            "QuickSand"),
                                                  ),
                                                  Text(
                                                    "Idosos",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                        fontFamily:
                                                            "QuickSand"),
                                                  )
                                                ],
                                              );
                                            }
                                          })
                                    ],
                                  ),
                                )
                              ],
                            ))),
                      ),
                      elevation: 10,
                    ),
                    Image.asset(
                      "assets/woman.png",
                      height: 400,
                      width: 300,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
