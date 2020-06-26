import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruagramapp/agentePublico/modules/solicitacoes/tab/coleta_confirmada.dart';
import 'package:ruagramapp/perfil_psr.dart';

class SolicitacoesRecebidasTile extends StatefulWidget {
  final DocumentSnapshot snapshot;

  SolicitacoesRecebidasTile(this.snapshot);

  @override
  _SolicitacoesRecebidasTileState createState() =>
      _SolicitacoesRecebidasTileState(this.snapshot);
}

class _SolicitacoesRecebidasTileState extends State<SolicitacoesRecebidasTile> {
  final DocumentSnapshot snapshot;

  _SolicitacoesRecebidasTileState(this.snapshot);
  final controllerDoacao = TextEditingController();
  final controllerEndereco = TextEditingController();

  bool btn_coleta = false;
  @override
  void initState() {
    // TODO: implement initStater
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerDoacao.text = snapshot.data["doacao"];
    controllerEndereco.text = snapshot.data["endereco"];
    final GlobalKey _columnKey = new GlobalKey();

    return Column(
      key: _columnKey,
      children: <Widget>[
        Card(
          color: Colors.transparent,
          elevation: 5,
          child: Column(
            children: <Widget>[
              InkWell(
                child: Container(
                    width: 300,
                    height: 380,
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
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 34),
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
                                                "https://associacaorenascer.org.br/wp-content/uploads/2018/12/heart.png"),
                                          ))),
                                )),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Doador(a): " +
                                      snapshot.data["nome"] +
                                      "\n Telefone: " +
                                      snapshot.data["telefone"],
                                  style: TextStyle(
                                    fontFamily:
                                        "assets/fonts/GillSansLight.ttf",
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: TextField(
                                  autofocus: false,
                                  maxLines: 2,
                                  enabled: false,
                                  controller: controllerDoacao,
                                  decoration: InputDecoration(
                                    labelText: "Produto(s)",
                                    border: InputBorder.none,
                                    icon: Icon(Icons.card_giftcard),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: TextField(
                                  autofocus: false,
                                  maxLines: 2,
                                  enabled: false,
                                  controller: controllerEndereco,
                                  decoration: InputDecoration(
                                    labelText: "Endereço para coleta:",
                                    border: InputBorder.none,
                                    icon: Icon(Icons.person_pin_circle),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              OutlineButton(
                                hoverColor: Colors.white,
                                highlightColor: Colors.white70,
                                highlightElevation: 10,
                                child: Container(
                                    width: 140,
                                    height: 30,
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Text(
                                        snapshot.data["coletado"] == false
                                            ? 'Confirmar Coleta'
                                            : "Já Coletado",
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                onPressed: snapshot.data["coletado"] == false
                                    ? () {
                                        DocumentReference documentReference =
                                            Firestore.instance
                                                .collection("DoacoesRecebidas")
                                                .document(snapshot.documentID);

                                        documentReference
                                            .updateData({"coletado": true});
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ColetaConfirmada()));
                                      }
                                    : null,

//                                Navigator.of(context).push(MaterialPageRoute(
//                                    builder: (context) => PaginaEmpresa(
//                                        snapshot.data["nomeEmpresa"],
//                                        snapshot.data["imagem"],
//                                        snapshot.data["descricao"],
//                                        snapshot.data["galeriaPagina"],
//                                        snapshot.data["telefone"])));

                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white30)),
                                // callback when button is clicked
                                borderSide: BorderSide(
                                  color: Colors.blueGrey, //Color of the border
                                  style:
                                      BorderStyle.solid, //Style of the border
                                  width: 0.8, //width of the border
                                ),
                              ),
                            ],
                          ),
                        )
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
