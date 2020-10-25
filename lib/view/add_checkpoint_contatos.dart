import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tela_inicial/controller/controller.dart';
import 'package:tela_inicial/view/tela_principal.dart';
import '../model/model.dart';

class add_checkpoint_contato extends StatefulWidget {
  @override
  add_checkpoint_contato_Estado createState() => add_checkpoint_contato_Estado();

  Widget build(BuildContext context) => Scaffold();
}

// ignore: camel_case_types, must_be_immutable
class add_checkpoint_contato_Estado extends State<add_checkpoint_contato> {

  @override

  Widget build(BuildContext context) {





    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: estilo.cor,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 360),

            child: Row(children: <Widget>[
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    controller_add_checkpoint_mapa.voltar(context);
                  },
                ),
              ),
            ]),
          ),
        ],
      ),


      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Center(
          child: Column(children: <Widget>[
            SizedBox(height: 30),



            for ( int contar_conta = 0; contar_conta < model.Contatos.length  ; contar_conta++)Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              height: 100,
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                  children: <Widget>[
                    SizedBox(width: 10,),
                    Image.asset("assents/perfil.png",cacheHeight: 70,),
                    Container(
                      width: 150,
                      child:
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: new TextStyle(
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(text: '   ${model.Contatos[contar_conta][0]} \n  ', style: TextStyle( fontSize: 25 )),
                                TextSpan(text: ' ${model.Contatos[contar_conta][1]}' , style: TextStyle( fontSize: 15 )),
                              ])
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.navigate_next,
                      ),
                      iconSize: 40,
                      onPressed: () {
                        model.addCheckpointContato(contar_conta);
                        controller_add_checkpoint_contato.proxima(context);
                      },
                    ),
                  ]),
            ),






          ]),
        ),
      ),

      bottomNavigationBar: Container(
        height: 75.0,
        decoration: new BoxDecoration(
          color: estilo.cor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 15.0,
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 50.0,
        ),
      ),


);

  }
}
