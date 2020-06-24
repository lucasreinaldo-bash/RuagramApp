import 'package:flutter/material.dart';
import 'package:ruagramapp/cidadaoComum/login_cidadao_comum.dart';

import 'Login.dart';

class EscolherAmbiente extends StatefulWidget {
  @override
  _EscolherAmbienteState createState() => _EscolherAmbienteState();
}

class _EscolherAmbienteState extends State<EscolherAmbiente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Center(
              child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Container(
              width: 400,
              height: 400,
              child: Center(
                child: Transform.scale(
                    scale: 1.2, child: Image.asset("assets/logo.png")),
              ),
            ),
          )),
          SizedBox(
            height: 20,
          ),
          Text(
            'Escolha uma opção:\n',
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontFamily: "QuickSand",
            ),
          ),
          OutlineButton(
            color: Colors.white70,
            hoverColor: Colors.white,
            highlightColor: Colors.white70,
            highlightElevation: 10,
            child: Text(
              'Sou Profissional Autorizado',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "QuickSand",
              ),
            ),

            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Login()));

//                Navigator.of(context).push(MaterialPageRoute(
//                    builder: (context) =>
//                        BottomPrincipal(nomeEmpresa, imagemEmpresa)));
            },
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
          OutlineButton(
            color: Colors.white70,
            hoverColor: Colors.white,
            highlightColor: Colors.white70,
            highlightElevation: 10,
            child: Text(
              'Sou Cidadão Comum         ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: "QuickSand",
              ),
            ),

            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginCidadaoComum()));

//                Navigator.of(context).push(MaterialPageRoute(
//                    builder: (context) =>
//                        BottomPrincipal(nomeEmpresa, imagemEmpresa)));
            },
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
    ));
  }
}
