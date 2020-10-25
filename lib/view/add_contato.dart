import 'package:flutter/material.dart';
import '../controller/controller.dart';
import '../model/model.dart';




// ignore: camel_case_types, must_be_immutable
class add_contato extends StatefulWidget {
  @override
  add_contato_Estado createState() => add_contato_Estado();

  Widget build(BuildContext context) => Scaffold();
}

class add_contato_Estado extends State<add_contato> {
  static String contato = "";
  static String telefone = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: Column(children: <Widget>[
          Container(
            height: 80,
            color: estilo.cor,
            child:
            Row(

              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: IconButton(
                    icon: Icon(
                      Icons.clear,
                    ),
                    onPressed: () {
                      controller_add_contato.voltar(context);
                    },
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 10, left: 0, right: 00),
            height: 100,
            width: 320,
            child: Image.asset('assents/perfil.png',height: 100),
          ),



          Container(
            margin: const EdgeInsets.only(top: 0, left: 0, right: 10),
            height: 60,
            width: 320,
            child: TextFormField(
              onChanged: (text) {
                contato = text;
                reassemble();
              },
              decoration: InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                  labelText: 'contato',
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 5)),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 30, left: 0, right: 10),
            height: 60,
            width: 320,
            child: TextFormField(
              onChanged: (text) {
                telefone = text;
                reassemble();
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                  labelText: 'telefone',
                  isDense: true,
                  contentPadding: EdgeInsets.only(bottom: 5)),
            ),
          ),



        ]),
      ),


      bottomSheet:
      Container(
        height: 70,
      child:
      Column(  children: <Widget>[
      Container(

        decoration: new BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Container(
          margin:
              const EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 10),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 50.0,
          child: RaisedButton(
            onPressed: () {
              if(controller_add_contato.boolContato(contato, telefone)){
                controller_add_contato.setContato(contato, telefone);
                controller_login.proxima(context);
              }
            },
            child: const Text(
              'adicionar',
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.black,
                  ),
            ),
            color: controller_add_contato.boolContato(contato,telefone)? estilo.cor :Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ),

    ]),
      )
    );
  }
}
