import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ruagramapp/agentePublico/menuPrincipal.dart';
import 'package:ruagramapp/agentePublico/modules/solicitacoes/solicitaoes_recebidas_tile.dart';
import 'package:ruagramapp/informacoesMoradoresTile.dart';
import 'package:ruagramapp/models/user_model.dart';

class SolicitacoesRecebidasTab extends StatefulWidget {
  @override
  _SolicitacoesRecebidasTabState createState() =>
      _SolicitacoesRecebidasTabState();
}

class _SolicitacoesRecebidasTabState extends State<SolicitacoesRecebidasTab> {
  String _cidade;
  TextEditingController _senhaController = TextEditingController();
  FirebaseUser firebaseUser;

  @override
  Widget build(BuildContext context) {
    String uid = UserModel.of(context).firebaseUser.uid;
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.purple,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MenuPrincipal()));
                // do something
              },
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: StreamBuilder(
          stream: Firestore.instance
              .collection("Usuarios")
              .document(uid)
              .snapshots(),
          builder: (context, snap) {
            if (!snap.hasData) {
              return CircularProgressIndicator();
            } else {
              return FutureBuilder<QuerySnapshot>(
                future: Firestore.instance
                    .collection("DoacoesRecebidas")
                    .where("cidadeEstado", isEqualTo: snap.data["cidadeEstado"])
                    .getDocuments(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  else {
                    return Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    children: <Widget>[],
                                  )),
                            ),
                            Image.asset(
                              "assets/logo.png",
                              height: 100,
                              width: 100,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 1, top: 20),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "Doações recebidas por voluntários: ",
                                  style: TextStyle(
                                    fontFamily: "QuickSand",
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.only(top: 10),
                                  children: snapshot.data.documents.map((doc) {
                                    return Column(
                                      children: <Widget>[
                                        SolicitacoesRecebidasTile(doc),
                                      ],
                                    );
                                  }).toList()),
                            ),
                          ],
                        )
                      ],
                    );
                  }
                },
              );
            }
          },
        ));
  }
}
