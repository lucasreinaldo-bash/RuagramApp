import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ruagramapp/agentePublico/modules/psr/menu_psr.dart';
import 'package:ruagramapp/geolocalizacaoUsuario.dart';
import 'package:ruagramapp/telaAviso.dart';

import '../../../models/user_model.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  FirebaseUser firebaseUser;
  @override
  Widget build(BuildContext context) {
    String uid = UserModel.of(context).firebaseUser.uid;
    return Scaffold(
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
      body: Column(
        children: <Widget>[
          Center(
            child: Column(
              children: [
                Card(
                  child: Container(
                    height: 200,
                    width: 350,
                    child: (Padding(
                        padding: EdgeInsets.only(top: 50, left: 40, right: 40),
                        child: Column(
                          children: [
                            Text(
                              "População em Situação de Rua",
                              style: TextStyle(fontFamily: "QuickSand"),
                            ),
                            StreamBuilder(
                              stream: Firestore.instance
                                  .collection("ConsumidorFinal")
                                  .document(uid)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                } else {
                                  return Text(
                                    "Localidade: " +
                                        snapshot.data["cidadeEstado"],
                                    style: TextStyle(
                                        fontFamily: "QuickSand",
                                        color: Colors.black54),
                                  );
                                }
                              },
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
                                          .where("sexo", isEqualTo: "Masculino")
                                          .getDocuments(),
                                      builder: (context, snapshot2) {
                                        if (!snapshot2.hasData) {
                                          CircularProgressIndicator();
                                        } else {
                                          return Column(
                                            children: [
                                              Text(
                                                snapshot2.data.documents.length
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 40,
                                                    fontFamily: "QuickSand"),
                                              ),
                                              Text(
                                                "Homens",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "QuickSand"),
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
                                          .where("sexo", isEqualTo: "Feminino")
                                          .getDocuments(),
                                      builder: (context, snapshot2) {
                                        if (!snapshot2.hasData) {
                                          CircularProgressIndicator();
                                        } else {
                                          return Column(
                                            children: [
                                              Text(
                                                snapshot2.data.documents.length
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 40,
                                                    fontFamily: "QuickSand"),
                                              ),
                                              Text(
                                                "Mulheres",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "QuickSand"),
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
                                                snapshot2.data.documents.length
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 40,
                                                    fontFamily: "QuickSand"),
                                              ),
                                              Text(
                                                "Idosos",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "QuickSand"),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
