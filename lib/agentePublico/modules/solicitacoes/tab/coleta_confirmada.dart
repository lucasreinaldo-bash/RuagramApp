import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ruagramapp/agentePublico/modules/dashboard/dashboard_screen.dart';
import 'package:ruagramapp/agentePublico/modules/psr/menu_psr.dart';
import 'package:ruagramapp/agentePublico/modules/solicitacoes/tab/solicitacoes_recebidas_tab.dart';
import 'package:ruagramapp/geolocalizacaoUsuario.dart';
import 'package:ruagramapp/telaAviso.dart';

class ColetaConfirmada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        iconTheme: IconThemeData(
          color: Colors.purple, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      )),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset("assets/moradorrede.png"),
              Text(
                "Coleta Confirmada!",
                style: TextStyle(fontFamily: "QuickSand", fontSize: 20),
              ),
              RaisedButton(
                color: Colors.white,
                child: Text("Voltar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
