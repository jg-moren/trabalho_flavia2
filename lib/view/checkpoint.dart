import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tela_inicial/controller/controller.dart';
import '../model/model.dart';

// ignore: camel_case_types, must_be_immutable
class checkpoint extends  StatelessWidget  {
  static int id;

  @override

  Widget build(BuildContext context) {





    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Center(
          child: Column(children: <Widget>[
            SizedBox(height: 30),



            for ( int contar_check = 0; contar_check < model.Checkpoints.length  ; contar_check++)Container(
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
                  SizedBox(width: 20,),
                  Image.asset("assents/point.png",cacheHeight: 70,),
              Container(
                width: 175,
                child:FlatButton(
                  onPressed: (){
                    id=contar_check;
                    controller_checkpoint.ver(context);
                  },
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: new TextStyle(
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: '   ${model.Checkpoints[contar_check][0]} \n  ', style: TextStyle( fontSize: 25 )),
                            TextSpan(text: '${model.Checkpoints[contar_check][2]}' , style: TextStyle( fontSize: 15 )),
                          ])
                  ),
                ),
              ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                    ),
                    iconSize: 40,
                    onPressed: () {
                      model.delCheckpoint(contar_check);
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
              controller_checkpoint.add(context);
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
