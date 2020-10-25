import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tela_inicial/view/contatos.dart';
import 'package:tela_inicial/view/mapa.dart';
import '../controller/controller.dart';
import '../model/model.dart';
import 'checkpoint.dart';




// ignore: camel_case_types, must_be_immutable
class tela_principal extends StatefulWidget {
  @override
  tela_principal_Estado createState() => tela_principal_Estado();

  Widget build(BuildContext context) => Scaffold();

}

class tela_principal_Estado extends State<tela_principal> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: estilo.cor,
            bottom: TabBar(
              tabs: [
                Tab(child: Text("Contato",style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize:20))),
                Tab(child: Text("Mapa",style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize:20))),
                Tab(child: Text("Checkpoint",style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize:20))),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget> [
              contato(),
              Mapa(),
              checkpoint(),
            ],
          ),
        ),
      ),
    );
  }
}


