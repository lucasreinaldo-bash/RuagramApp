import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruagramapp/perfildoAnjo.dart';

class InformacoesMoradoresTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  InformacoesMoradoresTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          color: Colors.transparent,
          elevation: 5,
          child: Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PerfildoAnjo(
                          snapshot.data["nomeCompleto"],
                          snapshot.data["imagem"],
                          snapshot.data["historia"],
                          snapshot.data["telefoneResponsavel"])));
                },
                child: Container(
                    width: 200,
                    height: 320,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new AssetImage("assets/fundo_card.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 60),
                              child: Center(
                                  child: Card(
                                elevation: 70,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(120.0),
                                    side: BorderSide(color: Colors.white30)),
                                child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new NetworkImage(
                                              snapshot.data["imagem"]),
                                        ))),
                              )),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                snapshot.data["nomeCompleto"],
                                style: TextStyle(
                                  fontFamily: "assets/fonts/GillSansLight.ttf",
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                snapshot.data["apelido"],
                                style: TextStyle(
                                  fontFamily: "assets/fonts/GillSansLight.ttf",
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                snapshot.data["historia"],
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "assets/fonts/GillSansLight.ttf",
                                  color: Colors.black26,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              snapshot.data["apadrinhada"] == "Sim"
                                  ? "Apadrinhado(a): Não"
                                  : "Apadrinhado(a): Sim",
                              textAlign: TextAlign.left,
                            ),
                            Text(
                                "Visitas no perfil: " +
                                    snapshot.data["visitas"].toString() +
                                    " pessoas.",
                                textAlign: TextAlign.left),
                            OutlineButton(
                              hoverColor: Colors.white,
                              highlightColor: Colors.white70,
                              highlightElevation: 10,
                              child: Container(
                                width: 111,
                                height: 30,
                                child: Row(
                                  children: <Widget>[
                                    Text(snapshot.data["genero"] == "Masculino"
                                        ? 'Quero conhecê-lo'
                                        : "Quero conhecê-la"),
                                  ],
                                ),
                              ),
                              onPressed: () {
                                Future<Null> _atualizarVisitas() async {
                                  DocumentReference documentReference =
                                      Firestore.instance
                                          .collection("Anjos")
                                          .document(snapshot.documentID);
                                  int visitasAtuais = snapshot.data["visitas"];
                                  visitasAtuais++;
                                  Firestore.instance
                                      .runTransaction((transaction) async {
                                    await transaction.update(documentReference,
                                        {"visitas": visitasAtuais});
                                  });
                                }

                                _atualizarVisitas();
                              },

//                                Navigator.of(context).push(MaterialPageRoute(
//                                    builder: (context) => PaginaEmpresa(
//                                        snapshot.data["nomeEmpresa"],
//                                        snapshot.data["imagem"],
//                                        snapshot.data["descricao"],
//                                        snapshot.data["galeriaPagina"],
//                                        snapshot.data["telefone"])));

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
                        SizedBox(
                          width: 60,
                          height: 70,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Card(
                                elevation: 40,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(90.0),
                                    side: BorderSide(color: Colors.white30)),
                                child: Padding(
                                  padding: EdgeInsets.all(2),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(snapshot.data["visitas"].toString()),
                                      Icon(
                                        Icons.person_outline,
                                        color: Colors.amber,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}
