import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tela_inicial/controller/controller.dart';
import 'package:tela_inicial/view/tela_principal.dart';
import '../model/model.dart';

class contato extends StatefulWidget {
  @override
  contato_Estado createState() => contato_Estado();

  Widget build(BuildContext context) => Scaffold();
}

// ignore: camel_case_types, must_be_immutable
class contato_Estado extends State<contato> {

  @override

  Widget build(BuildContext context) {





    return Scaffold(
      backgroundColor: Colors.white,

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
                      width: 175,
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
                        Icons.close,
                      ),
                      iconSize: 40,
                      onPressed: () {
                        model.delContato(contar_conta);
                        (context as Element).reassemble();
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
          child: RaisedButton(
            onPressed: () {
              controller_contato.add(context);
            },
            child: const Text(
              'Adicionar',
              style: TextStyle(fontSize: 19, color: Colors.black),
            ),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ),


);

  }
}
