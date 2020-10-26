import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tela_inicial/controller/controller.dart';
import '../model/model.dart';
import 'checkpoint.dart';
class checkpoint_ver extends StatefulWidget {
  @override
  checkpoint_ver_Estado createState() => checkpoint_ver_Estado();

  Widget build(BuildContext context) => Scaffold();
}

// ignore: camel_case_types, must_be_immutable
class checkpoint_ver_Estado extends State<checkpoint_ver> {

  @override

  Widget build(BuildContext context) {





    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: estilo.cor,
        title:  Row(children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
                onPressed: () {
                  controller_checkpoint.voltar(context);
                },
              ),
            Text('${model.Checkpoints[checkpoint.id][0]}  ', style: TextStyle( fontSize: 25, color: Colors.black )),
          ]),

        automaticallyImplyLeading: false,

      ),


      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Center(
          child: Column(children: <Widget>[
            SizedBox(height: 10),


            SizedBox(height: 20,),
            Text('Contato ', style: TextStyle( fontSize: 25, color: Colors.black )),
           Container(
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
                                TextSpan(text: '   ${model.Checkpoints[checkpoint.id][2]}  ', style: TextStyle( fontSize: 25 )),
                              ])
                      ),
                    ),
                  ]),
            ),


            SizedBox(height: 20,),
            Text('Endereco ', style: TextStyle( fontSize: 25, color: Colors.black )),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child:
                    Container(
                      margin: const EdgeInsets.only(top: 10, left: 10, right: 10,bottom: 10),
                      child:
                      RichText(
                        //overflow: TextOverflow.clip,
                          text: TextSpan(

                              style: new TextStyle(
                                color: Colors.black,
                              ),

                              children: <TextSpan>[
                                TextSpan(text: '${model.Checkpoints[checkpoint.id][1][1]}  ' ,style: TextStyle( fontSize: 25  )),

                              ])
                      ),
                    ),
            ),
            SizedBox(height: 20,),
            Text('Mensagem  ', style: TextStyle( fontSize: 25, color: Colors.black )),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child:
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10,bottom: 10),
                child:
                RichText(
                  //overflow: TextOverflow.clip,
                    text: TextSpan(

                        style: new TextStyle(
                          color: Colors.black,
                        ),

                        children: <TextSpan>[
                          TextSpan(text: '${model.Checkpoints[checkpoint.id][3]}  ' ,style: TextStyle( fontSize: 25  )),

                        ])
                ),
              ),
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
                controller_checkpoint.voltar(context);
              },
              child: const Text(
                'voltar',
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
