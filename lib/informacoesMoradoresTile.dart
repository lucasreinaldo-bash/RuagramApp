import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruagramapp/perfil_psr.dart';

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
                                              snapshot.data["photo"]),
                                        ))),
                              )),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                snapshot.data["nome"],
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
                                snapshot.data["localizacaoFrequente"],
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
                            OutlineButton(
                              hoverColor: Colors.white,
                              highlightColor: Colors.white70,
                              highlightElevation: 10,
                              child: Container(
                                  width: 111,
                                  height: 30,
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      snapshot.data["sexo"] == "Masculino"
                                          ? 'Ver Perfil'
                                          : "Ver Perfil",
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PerfilPsr(
                                          snapshot.data["nome"],
                                          snapshot.data["photo"],
                                          snapshot.data["localizacaoFrequente"],
                                          snapshot.data["apelido"],
                                          snapshot.data["cadUnico"],
                                          snapshot.data["cidadeEstado"],
                                          snapshot.data["dataNascimento"],
                                          snapshot.data["doencas"],
                                          snapshot.data["escolaridade"],
                                          snapshot.data["idoso"],
                                          snapshot
                                              .data["profissionalResponsavel"],
                                          snapshot.data["cressResponsavel"],
                                          snapshot.data["sexo"],
                                          snapshot.data["sus"],
                                        )));
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
