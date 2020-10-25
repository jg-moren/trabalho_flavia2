import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tela_inicial/model/model.dart';
import '../controller/controller.dart';

// ignore: camel_case_types, must_be_immutable
class add_checkpoint_mensagem extends StatefulWidget {
  @override
  add_checkpoint_mensagem_Estado createState() => add_checkpoint_mensagem_Estado();

  Widget build(BuildContext context) => Scaffold();
}

class add_checkpoint_mensagem_Estado extends State<add_checkpoint_mensagem> {
  String marcador = "";
  String mensagem = "";

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
                      controller_add_contato.voltar(context);
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

              //---------------------------------------Nome--------------------------
              Container(
                margin: const EdgeInsets.only(top: 0, left: 0, right: 10),
                height: 60,
                width: 320,
                child: TextFormField(
                  onChanged: (text) {
                    marcador = text;
                    reassemble();
                  },
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 18,
                      ),
                      labelText: 'marcador',
                      isDense: true,
                      contentPadding: EdgeInsets.only(bottom: 5)),
                ),
              ),

              //---------------------------------------Telefone--------------------------


              //---------------------------------------Check--------------------------


              //---------------------------------------ocorrencia--------------------------
              Container(
                margin: const EdgeInsets.only(top: 0, left: 0, right: 10),
                width: 320,
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 5,
                  maxLines: 6,
                  onChanged: (text) {
                    mensagem = text;
                    reassemble();
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Escreva a mensagem',
                    hintStyle: TextStyle(fontSize: 18),
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              //---------------------------------------enviar ocorrencia--------------------------
              SizedBox(height: 200),
            ]),
          ),
        ),

        //--------------------------------------ligar--------------------------
        bottomSheet: Container(
          height: 70,
          child: Column(children: <Widget>[
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
                margin: const EdgeInsets.only(
                    top: 10, left: 50, right: 50, bottom: 10),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    if (controller_add_checkpoint_mensagem.boolCheckpointMensagem(
                        marcador, mensagem)) {
                      controller_add_checkpoint_mensagem.setCheckpointMensagem(marcador,mensagem);
                      controller_add_checkpoint.salvar();
                      controller_add_checkpoint_mensagem.proxima(context);
                    }
                  },
                  child: const Text(
                    'salvar',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                    ),
                  ),
                  color: controller_add_checkpoint_mensagem.boolCheckpointMensagem(
                          marcador,mensagem)
                      ? estilo.cor
                      : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
