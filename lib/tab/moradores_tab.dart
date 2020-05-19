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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.menu,
          color: Colors.deepPurple,
        ),
        heroTag: "demoValue",
        elevation: 10,
        highlightElevation: 20,
        focusElevation: 10,
        hoverElevation: 20,
        backgroundColor: Colors.white,
        onPressed: () async {},
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance
            .collection("Anjos")
            .where("cidade", arrayContains: cidade)
            .getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            return Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.menu,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: <Widget>[],
                          )),
                    ),
                    SizedBox(
                        height: 150.0,
                        width: 350.0,
                        child: Carousel(
                          images: [
                            Image.asset("assets/logo.png"),
                          ],
                          dotSize: 4.0,
                          dotSpacing: 15.0,
                          dotColor: Colors.blueGrey,
                          indicatorBgPadding: 5.0,
                          dotBgColor: Colors.white12,
                          borderRadius: true,
                          moveIndicatorFromBottom: 180.0,
                          noRadiusForIndicator: true,
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 1, top: 10),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Você está em $cidade",
                          style: TextStyle(
                            color: Colors.black38,
                            fontFamily: "QuickSand",
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 1, top: 20),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Veja os anjos que estão proximos de você: ",
                          style: TextStyle(
                            fontFamily: "QuickSand",
                            fontSize: 20,
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
