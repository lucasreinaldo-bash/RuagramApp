import 'dart:io';

import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/user_model.dart';

class CadastrarPSR extends StatefulWidget {
  String uid;

  CadastrarPSR({this.uid});
  @override
  _CadastrarPSRState createState() => _CadastrarPSRState();
}

class _CadastrarPSRState extends State<CadastrarPSR> {
  File _image;
  String _uploadedFileURL;

  String uid;
  _CadastrarPSRState();
  final controllerNome = TextEditingController();
  final controllerApelido = TextEditingController();
  final controllerLocalizacaoFrequente = TextEditingController();
  final controllerResponsavel = TextEditingController();
  final controllerDataNascimento = TextEditingController();
  final controllerEscolaridade = TextEditingController();
  final controllerNumeroCAD = TextEditingController();
  final controllerNumeroSUS = TextEditingController();
  final controllerDoencas = TextEditingController();
  final controller = TextEditingController();

  String cidade;
  bool checkedValue = false;
  bool alterar;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String preferencia;
  String preferenciaIdoso;
  List variacao = ["Masculino", "Feminino"];
  List variacaoIdoso = ["Não", "Sim"];
  String docUrl =
      "https://www.pngmart.com/files/10/User-Account-Person-PNG-File.png";
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print("image Path $_image");
        Future uploadPic(BuildContext context) async {
          String filName = basename(_image.path);
          StorageReference firebaseStorageRef =
              FirebaseStorage.instance.ref().child(filName);
          StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
          StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
          docUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
          setState(() {
            print(docUrl);
          });
        }

        uploadPic(context);
      });
    }

    if (UserModel.of(context).isLoggedIn()) {
      String uid = UserModel.of(context).firebaseUser.uid;
      print(uid);

      return StreamBuilder(
        stream: Firestore.instance
            .collection("ConsumidorFinal")
            .document(uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            controllerResponsavel.text = snapshot.data["nome"];
            cidade = snapshot.data["cidadeEstado"];
            return Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  iconTheme: new IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                ),
                body: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 1),
                      child: ListView(
                        children: <Widget>[
                          Card(
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    children: <Widget>[
                                      Center(
                                          child: Stack(
                                        children: <Widget>[
                                          Card(
                                              elevation: 40,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          100.0),
                                                  side: BorderSide(
                                                      color: Colors.white30)),
                                              child: Stack(
                                                children: <Widget>[
                                                  Container(
                                                      width: 150.0,
                                                      height: 150.0,
                                                      decoration: new BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image: new DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  new NetworkImage(
                                                                      docUrl)))),
                                                ],
                                              )),
                                        ],
                                      )),
                                      Center(
                                          child: IconButton(
                                        onPressed: () {
                                          getImage();
                                        },
                                        icon: Icon(Icons.camera_alt),
                                      )),
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: <Widget>[
                                                TextField(
                                                  autofocus: false,
                                                  onTap: () {
                                                    alterar = true;
                                                  },
                                                  controller: controllerNome,
                                                  decoration: InputDecoration(
                                                    labelText: "Nome Completo",
                                                    border: InputBorder.none,
                                                    icon: Icon(Icons.person),
                                                  ),
                                                ),
                                                TextField(
                                                  onChanged: (text) {
                                                    alterar = true;
                                                  },
                                                  autofocus: false,
                                                  controller: controllerApelido,
                                                  decoration: InputDecoration(
                                                    labelText: "Apelido",
                                                    border: InputBorder.none,
                                                    icon: Icon(
                                                        Icons.person_outline),
                                                  ),
                                                ),
                                                Text("Gênero:"),
                                                SizedBox(
                                                  height: 40,
                                                  child: GridView(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 4),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 1,
                                                              mainAxisSpacing:
                                                                  12,
                                                              childAspectRatio:
                                                                  0.30),
                                                      children:
                                                          variacao.map((s) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              preferencia = s;
                                                            });
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            4)),
                                                                border: Border.all(
                                                                    color: s ==
                                                                            preferencia
                                                                        ? Colors.green[
                                                                            600]
                                                                        : Colors
                                                                            .grey,
                                                                    width: s ==
                                                                            preferencia
                                                                        ? 4
                                                                        : 2)),
                                                            width: 50,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(s),
                                                          ),
                                                        );
                                                      }).toList()),
                                                ),
                                                Text("Idoso(a):"),
                                                SizedBox(
                                                  height: 40,
                                                  child: GridView(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 4),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 1,
                                                              mainAxisSpacing:
                                                                  12,
                                                              childAspectRatio:
                                                                  0.30),
                                                      children: variacaoIdoso
                                                          .map((s) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              preferenciaIdoso =
                                                                  s;
                                                            });
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            4)),
                                                                border: Border.all(
                                                                    color: s ==
                                                                            preferenciaIdoso
                                                                        ? Colors.green[
                                                                            600]
                                                                        : Colors
                                                                            .grey,
                                                                    width: s ==
                                                                            preferenciaIdoso
                                                                        ? 4
                                                                        : 2)),
                                                            width: 50,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(s),
                                                          ),
                                                        );
                                                      }).toList()),
                                                ),
                                                TextField(
                                                  onChanged: (text) {
                                                    alterar = true;
                                                  },
                                                  autofocus: false,
                                                  controller:
                                                      controllerLocalizacaoFrequente,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        "Localização Frequente",
                                                    border: InputBorder.none,
                                                    icon:
                                                        Icon(Icons.location_on),
                                                  ),
                                                ),
                                                TextField(
                                                  onChanged: (text) {
                                                    alterar = true;
                                                  },
                                                  autofocus: false,
                                                  controller:
                                                      controllerDataNascimento,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        "Data de Nascimento",
                                                    border: InputBorder.none,
                                                    icon: Icon(
                                                        Icons.calendar_today),
                                                  ),
                                                ),
                                                TextField(
                                                  onChanged: (text) {
                                                    alterar = true;
                                                  },
                                                  autofocus: false,
                                                  controller:
                                                      controllerEscolaridade,
                                                  decoration: InputDecoration(
                                                    labelText: "Escolaridade",
                                                    border: InputBorder.none,
                                                    icon: Icon(Icons.school),
                                                  ),
                                                ),
                                                ExpansionTile(
                                                  title: Text(
                                                      "Documentação Existente"),
                                                  children: [
                                                    Card(
                                                      child: Column(
                                                        children: [
                                                          TextField(
                                                            onChanged: (text) {
                                                              alterar = true;
                                                            },
                                                            autofocus: false,
                                                            controller:
                                                                controllerNumeroCAD,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  "Número do CAD Único",
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              icon: Icon(Icons
                                                                  .credit_card),
                                                            ),
                                                          ),
                                                          TextField(
                                                            onChanged: (text) {
                                                              alterar = true;
                                                            },
                                                            autofocus: false,
                                                            controller:
                                                                controllerNumeroSUS,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  "Número do Cartão SUS",
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              icon: Icon(Icons
                                                                  .credit_card),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      elevation: 5,
                                                    )
                                                  ],
                                                ),
                                                ExpansionTile(
                                                  title: Text("Dados Clínicos"),
                                                  children: [
                                                    Card(
                                                      child: Column(
                                                        children: [
                                                          TextField(
                                                            onChanged: (text) {
                                                              alterar = true;
                                                            },
                                                            autofocus: false,
                                                            maxLines: 6,
                                                            controller:
                                                                controllerDoencas,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  "Doenças Diagnósticadas",
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              icon: Icon(Icons
                                                                  .person_outline),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      elevation: 5,
                                                    ),
                                                  ],
                                                ),
                                                TextField(
                                                  onChanged: (text) {
                                                    alterar = true;
                                                  },
                                                  autofocus: false,
                                                  enabled: false,
                                                  controller:
                                                      controllerResponsavel,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        "Responsável pelo Cadastro",
                                                    border: InputBorder.none,
                                                    icon: Icon(
                                                        Icons.person_outline),
                                                  ),
                                                ),
                                                OutlineButton(
                                                  hoverColor: Colors.white,
                                                  highlightColor:
                                                      Colors.white70,
                                                  highlightElevation: 10,
                                                  child:
                                                      Text('Salvar Alterações'),
                                                  onPressed: () async {
                                                    FirebaseAuth _auth =
                                                        FirebaseAuth.instance;
                                                    FirebaseUser firebaseUser;
                                                    if (firebaseUser == null)
                                                      firebaseUser = await _auth
                                                          .currentUser();
                                                    if (firebaseUser != null) {
                                                      if (controllerNome.text
                                                                  .length <=
                                                              0 &&
                                                          controllerApelido.text
                                                                  .length <=
                                                              0) {
                                                        _scaffoldKey
                                                            .currentState
                                                            .showSnackBar(
                                                                SnackBar(
                                                          content: Text(
                                                              "Preencha os campos principais!"),
                                                          backgroundColor:
                                                              Colors.blueGrey,
                                                          duration: Duration(
                                                              seconds: 4),
                                                        ));
                                                      } else {
                                                        DocumentReference
                                                            documentReference =
                                                            Firestore.instance
                                                                .collection(
                                                                    "PopulacaoEmRua")
                                                                .document();

                                                        uid = firebaseUser.uid;
                                                        documentReference
                                                            .setData({
                                                          "nome": controllerNome
                                                              .text
                                                        });
                                                        documentReference
                                                            .updateData({
                                                          "apelido":
                                                              controllerApelido
                                                                  .text
                                                        });
                                                        documentReference
                                                            .updateData({
                                                          "photo": docUrl
                                                        });
                                                        documentReference
                                                            .updateData({
                                                          "sexo": preferencia
                                                        });
                                                        documentReference
                                                            .updateData({
                                                          "idoso":
                                                              preferenciaIdoso
                                                        });
                                                        documentReference
                                                            .updateData({
                                                          "localizacaoFrequente":
                                                              controllerLocalizacaoFrequente
                                                                  .text
                                                        });
                                                        documentReference
                                                            .updateData({
                                                          "dataNascimento":
                                                              controllerDataNascimento
                                                                  .text
                                                        });
                                                        documentReference
                                                            .updateData({
                                                          "escolaridade":
                                                              controllerEscolaridade
                                                                  .text
                                                        });
                                                        documentReference
                                                            .updateData({
                                                          "cadUnico":
                                                              controllerNumeroCAD
                                                                  .text
                                                        });
                                                        documentReference
                                                            .updateData({
                                                          "sus":
                                                              controllerNumeroSUS
                                                                  .text
                                                        });
                                                        documentReference
                                                            .updateData({
                                                          "doencas":
                                                              controllerDoencas
                                                                  .text
                                                        });
                                                        documentReference
                                                            .updateData({
                                                          "profissionalResponsavel":
                                                              controllerResponsavel
                                                                  .text
                                                        });
                                                        documentReference
                                                            .updateData({
                                                          "cidadeEstado": cidade
                                                        });

                                                        StreamBuilder(
                                                          stream: Firestore
                                                              .instance
                                                              .collection(
                                                                  "Dashboard")
                                                              .document(
                                                                  "quantitativo")
                                                              .snapshots(),
                                                          builder: (context,
                                                              snapshot) {
                                                            if (!snapshot
                                                                .hasData) {
                                                              print(
                                                                  "nao tem nada");
                                                            } else {
                                                              print(
                                                                  "nao tem nada");
                                                              if (preferencia ==
                                                                  "Masculino") {
                                                                int quantidadeAtual =
                                                                    snapshot.data[
                                                                        "homens"];
                                                                int quantidadeAtualTotal =
                                                                    snapshot.data[
                                                                        "total"];
                                                                quantidadeAtual++;
                                                                quantidadeAtualTotal++;

                                                                DocumentReference
                                                                    documentReference =
                                                                    Firestore
                                                                        .instance
                                                                        .collection(
                                                                            "Dashboard")
                                                                        .document(
                                                                            "quantitativo");

                                                                documentReference
                                                                    .updateData({
                                                                  "homens":
                                                                      quantidadeAtual
                                                                });
                                                                documentReference
                                                                    .updateData({
                                                                  "total":
                                                                      quantidadeAtualTotal
                                                                });
                                                              } else if (preferencia ==
                                                                  "Feminino") {
                                                                int quantidadeAtual =
                                                                    snapshot.data[
                                                                        "mulheres"];
                                                                int quantidadeAtualTotal =
                                                                    snapshot.data[
                                                                        "total"];
                                                                quantidadeAtual++;
                                                                quantidadeAtualTotal++;

                                                                DocumentReference
                                                                    documentReference =
                                                                    Firestore
                                                                        .instance
                                                                        .collection(
                                                                            "Dashboard")
                                                                        .document(
                                                                            "quantitativo");

                                                                documentReference
                                                                    .updateData({
                                                                  "mulheres":
                                                                      quantidadeAtual
                                                                });
                                                                documentReference
                                                                    .updateData({
                                                                  "total":
                                                                      quantidadeAtualTotal
                                                                });
                                                              }
                                                              if (preferenciaIdoso ==
                                                                  "Sim") {
                                                                int quantidadeAtual =
                                                                    snapshot.data[
                                                                        "idosos"];
                                                                quantidadeAtual++;

                                                                DocumentReference
                                                                    documentReference =
                                                                    Firestore
                                                                        .instance
                                                                        .collection(
                                                                            "Dashboard")
                                                                        .document(
                                                                            "quantitativo");

                                                                documentReference
                                                                    .updateData({
                                                                  "idosos":
                                                                      quantidadeAtual
                                                                });
                                                              }
                                                            }
                                                          },
                                                        );
                                                        _scaffoldKey
                                                            .currentState
                                                            .showSnackBar(
                                                                SnackBar(
                                                          content: Text(
                                                              "Morador cadastrado com sucesso!"),
                                                          backgroundColor:
                                                              Colors.blueGrey,
                                                          duration: Duration(
                                                              seconds: 4),
                                                        ));
                                                        limparCampo();
                                                      }
                                                    }
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          new BorderRadius
                                                              .circular(18.0),
                                                      side: BorderSide(
                                                          color:
                                                              Colors.white30)),
                                                  // callback when button is clicked
                                                  borderSide: BorderSide(
                                                    color: Colors
                                                        .blueGrey, //Color of the border
                                                    style: BorderStyle
                                                        .solid, //Style of the border
                                                    width:
                                                        0.8, //width of the border
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ));
          }
        },
      );
    } else {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.remove_shopping_cart,
              size: 80,
              color: Colors.purple,
            ),
            SizedBox(height: 16),
            Text(
              "Faça login novamente",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            RaisedButton(
              color: Colors.purple,
              onPressed: () {},
              child: Text(
                "Entrar",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )
          ],
        ),
      );
    }
  }

  void limparCampo() {
    controllerNome.text = "";
    controllerApelido.text = "";
    controllerLocalizacaoFrequente.text = "";
    controllerDataNascimento.text = "";
    controllerEscolaridade.text = "";
    controllerNumeroCAD.text = "";
    controllerNumeroSUS.text = "";
    controllerDoencas.text = "";
    controllerResponsavel.text = "";
    docUrl =
        "https://www.pngmart.com/files/10/User-Account-Person-PNG-File.png";
  }

  void onErrorCallback(error, stackTrace) {
    print(error);
    print(stackTrace);
  }

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image as File;
      });
    });
  }
}
