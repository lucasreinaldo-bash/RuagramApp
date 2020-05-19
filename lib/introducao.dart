import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ruagramapp/geolocalizacaoUsuario.dart';
import 'package:ruagramapp/telaAviso.dart';

class Introducao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/morador_bg2.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: null /* add child content content here */,
            ),
          ),
          Column(
            children: <Widget>[
              Image.asset("assets/moradorrede.png"),
              SizedBox(
                  height: 200.0,
                  width: 350.0,
                  child: Carousel(
                    images: [
                      Image.asset(
                        "assets/introducao_slide1.png",
                        height: 200,
                      ),
                      Image.asset("assets/introducao_slide2.png"),
                      Image.asset("assets/introducao_slide3.png"),
                      Image.asset("assets/introducao_slide4.png"),
                    ],
                    dotSize: 4.0,
                    dotSpacing: 15.0,
                    dotColor: Colors.white,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.deepPurple.withOpacity(0.5),
                    borderRadius: true,
                    moveIndicatorFromBottom: 180.0,
                    noRadiusForIndicator: true,
                  )),
//              Card(
//                elevation: 20,
//                color: Colors.black45,
//                child: Text(
//                  'Existem milhares de pessoas em situação de rua no nosso País. Infelizmente muitos deles são tratados como seres invisivéis. Nossa rede oferece um espaço para que voluntários realizem o catálogo dessas pessoas da sua região usando a geolocalização, bem como a sua história de vida. Que tal aprendermos um pouco com eles ? E se puder, você poderá ajudá-lo através do nossos sistema de apadriamento.',
//                  textAlign: TextAlign.start,
//                  style: TextStyle(
//                    fontSize: 13,
//                    color: Colors.white,
//                    fontFamily: "QuickSand",
//                    shadows: <Shadow>[
//                      Shadow(
//                        offset: Offset(1.0, 1.0),
//                        blurRadius: 3.0,
//                        color: Color.fromARGB(255, 0, 0, 0),
//                      )
//                    ],
//                  ),
//                ),
//              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 70),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Que tal começar a conhecer os moradores de rua da sua cidade ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: "QuickSand",
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )
                  ],
                ),
              ),
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
                'Quero Conhecer',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "QuickSand",
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )
                  ],
                ),
              ),

              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => TelaAviso()));

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
