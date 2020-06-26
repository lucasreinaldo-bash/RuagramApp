import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ruagramapp/agentePublico/modules/dashboard/dashboard_screen.dart';
import 'package:ruagramapp/agentePublico/modules/psr/menu_psr.dart';
import 'package:ruagramapp/agentePublico/modules/solicitacoes/tab/solicitacoes_recebidas_tab.dart';
import 'package:ruagramapp/geolocalizacaoUsuario.dart';
import 'package:ruagramapp/telaAviso.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset("assets/moradorrede.png"),
              SizedBox(
                  height: 300.0,
                  width: 350.0,
                  child: Carousel(
                    images: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MenuPsr()));
                        },
                        child: Image.asset("assets/btn_psr.png"),
                      ),
                      InkWell(
                        onTap: () {
                          print("a");
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DashboardScreen()));
                        },
                        child: Image.asset("assets/btn_dashboard.png"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SolicitacoesRecebidasTab()));
                        },
                        child: Image.asset("assets/btn_solicitacoes.png"),
                      ),
                    ],
                    dotSize: 5.0,
                    dotSpacing: 15.0,
                    dotColor: Colors.blueGrey,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.white.withOpacity(0.5),
                    borderRadius: true,
                    animationDuration: Duration(seconds: 5),
                    moveIndicatorFromBottom: 180.0,
                    noRadiusForIndicator: true,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
