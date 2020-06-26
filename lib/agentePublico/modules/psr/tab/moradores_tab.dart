import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ruagramapp/informacoesMoradoresTile.dart';

class MoradoresTab extends StatelessWidget {
  final String cidade, endereco;
  TextEditingController _senhaController = TextEditingController();

  MoradoresTab({Key key, @required this.cidade, @required this.endereco})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.purple, //change your color here
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection("PopulacaoEmRua")
            .where("cidadeEstado", isEqualTo: "Alagoinhas-Bahia")
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
                          "Essas são as pessoas em situação de rua na sua cidade:",
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
                                InformacoesMoradoresTile(doc),
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
      ),
    );
  }
}
