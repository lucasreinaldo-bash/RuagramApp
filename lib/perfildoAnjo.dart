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
  String nomeCompleto, imagem, historia, whatsappResponsavel;
  List galeriaPagina;

  UserModel user;
  PerfildoAnjo(@required this.nomeCompleto, @required this.imagem,
      @required this.historia, this.whatsappResponsavel);

  @override
  void initState() {
    print(galeriaPagina);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Image.asset("assets/icon_zap.png"),
          elevation: 10,
          highlightElevation: 20,
          focusElevation: 10,
          hoverElevation: 20,
          onPressed: () async {
            var whatsappUrl =
                "whatsapp://send?phone=${whatsappResponsavel}&text=${"Olá, vim através do App CompreAqui!"}";
            await canLaunch(whatsappUrl)
                ? launch(whatsappUrl)
                : print(
                    "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
          },
        ),
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
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 60,
                      ),
                      Text(
                        historia,
                        style: TextStyle(color: Colors.black38),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                      height: 200.0,
                      width: 350.0,
                      child: Carousel(
                        images: [
                          Image.asset("assets/logo.png"),
                        ],
                        dotSize: 4.0,
                        dotSpacing: 15.0,
                        dotColor: Colors.lightGreenAccent,
                        indicatorBgPadding: 5.0,
                        dotBgColor: Colors.green.withOpacity(0.5),
                        borderRadius: true,
                        moveIndicatorFromBottom: 180.0,
                        noRadiusForIndicator: true,
                      )),
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
