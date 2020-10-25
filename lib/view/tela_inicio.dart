import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tela_inicial/controller/controller.dart';
import 'package:tela_inicial/model/model.dart';





class tela_inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: estilo.cor,
        body: Center(
          child: new Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 24),
              ),
              Image.asset(
                'assents/logo.png',
              ),
              Container(
                width: 100,
                height: 150,
                margin: EdgeInsets.all(24),
                padding: EdgeInsets.only(top: 12),
                alignment: Alignment.center,
              ),
              Container(
                height: 50,
                //width: MediaQuery.of(context).size.width * 0.9,
                width: 300,

                child: RaisedButton(
                  onPressed: () {
                    controller_inicio.proxima(context);
                  },
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xffBBBBBB),
                      fontFamily: 'TitilliumWeb',
                    ),
                  ),
                  color: Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
