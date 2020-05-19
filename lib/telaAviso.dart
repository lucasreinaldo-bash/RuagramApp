import 'package:flutter/material.dart';
import 'package:ruagramapp/main.dart';

import 'Login.dart';
import 'geolocalizacaoUsuario.dart';

class TelaAviso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(50),
            child: Column(
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Transform.scale(
                        scale: 1.2, child: Image.asset("assets/insight.png")),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Antes de tudo...',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 30,
                    fontFamily: "QuickSand",
                  ),
                ),
                Text(
                  'É importante aprendermos que os termos "Mendigos/Pedinte" está em desuso . Essas palavras, embora façam parte do imaginário social, não define esse grupo de indivíduos. Além disso, ela serve para reforçar ainda mais o preconceito social.\n\n O termo correto é População em Situação de Rua (PSR), mas na nossa plataforma optamos em apelidar todos eles carinhosamente de " Anjos".',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 16,
                    fontFamily: "QuickSand",
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: OutlineButton(
              color: Colors.white70,
              hoverColor: Colors.white,
              highlightColor: Colors.white70,
              highlightElevation: 10,
              child: Text(
                'Eu compreendo',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "QuickSand",
                ),
              ),

              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GeolocalizacaoUsuario()));

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
          )
        ],
      ),
    );
  }
}
