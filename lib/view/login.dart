import 'package:flutter/material.dart';
import '../controller/controller.dart';
import '../model/model.dart';




// ignore: camel_case_types, must_be_immutable
class login extends StatefulWidget {
  @override
  login_Estado createState() => login_Estado();

  Widget build(BuildContext context) => Scaffold();
}

class login_Estado extends State<login> {
  static String nome = "";
  static String senha = "";


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
                      controller_login.voltar(context);
                    },
                  ),
                ),
              ],
            ),
          ),




          Container(
            margin: const EdgeInsets.only(top: 30, left: 0, right: 10),
            height: 60,
            width: 320,
            child: TextFormField(
              onChanged: (text) {
                nome = text;
                reassemble();
              },
              decoration: InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                  labelText: 'Nome',
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
                senha = text;
                reassemble();
              },
              obscureText: true,
              decoration: InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                  labelText: 'Senha',
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
              if(controller_login.setLogin(nome, senha)){
                controller_login.proxima(context);
              }
            },
            child: const Text(
              'Logar',
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.black,
                  ),
            ),
            color: controller_login.setLogin(nome,senha)? estilo.cor :Colors.grey,
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
