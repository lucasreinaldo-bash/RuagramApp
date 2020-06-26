import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ruagramapp/agentePublico/modules/psr/cadastrar_psr.dart';
import 'package:ruagramapp/agentePublico/modules/psr/tab/moradores_tab.dart';
import 'package:ruagramapp/geolocalizacaoUsuario.dart';
import 'package:ruagramapp/telaAviso.dart';

class MenuPsr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        iconTheme: IconThemeData(
          color: Colors.purple, //change your color here
        ),
        backgroundColor: Colors.white,
      )),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset(
                "assets/logo.png",
                height: 200,
                width: 200,
              ),
              Row(
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CadastrarPSR()));
                    },
                    child: Image.asset(
                      "assets/btn_cadastrarPSR.png",
                      height: 140,
                      width: 140,
                    ),
                  ),
                  FlatButton(
                    child: Image.asset(
                      "assets/btn_psrcidade.png",
                      height: 140,
                      width: 140,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MoradoresTab()));
                    },
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
