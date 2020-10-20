import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class formulario extends StatefulWidget {

  @override
  formulario_Estado createState() => formulario_Estado();

  Widget build(BuildContext context) => Scaffold();
}

class formulario_Estado extends State<formulario> {
  final TextStyle textstyle =
  TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  final InputDecoration decoration = InputDecoration(
    border: OutlineInputBorder(),
  );
  @override
  Widget build(BuildContext context) {
    bool a = false;
    bool b = false;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xffFFF09C),
        title: Text('Novo Marcador',
      ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 0, right: 5,),
                  width: 320,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                        labelStyle:
                        TextStyle(fontSize: 18),
                        labelText: 'Nome do novo marcador',
                        isDense: true,
                        contentPadding: EdgeInsets.only(bottom: 5)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 45, left: 0, right: 5,bottom: 10),
                  width: 320,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                        labelStyle:
                        TextStyle(fontSize: 18),
                        labelText: 'Endereço',
                        isDense: true,
                        contentPadding: EdgeInsets.only(bottom: 5)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 45, left: 0, right: 10),
                  width: 320,
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 5,
                    maxLines: 6,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Escreva uma mensagem programada aqui',
                      hintStyle:
                      TextStyle(fontSize: 18,),
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
                Row(
                    children: <Widget>[
                    Container(
                        width: 120,
                        margin: EdgeInsets.only(right: 0,),
                        child:  Image(image: AssetImage("assents/wpp.png"))),
                    Container(
                        width: 87.9,
                        margin: EdgeInsets.only(left: 150,),
                        child:  Image(image: AssetImage("assents/sms.png"))),
    ]
                  ),
                  Row(
                      children: <Widget>[
                        Container(
                  margin: EdgeInsets.only(right: 0,),
                          width: 320,
                          child: Row(children: <Widget>[
                            Checkbox(
                              value: a,
                                activeColor: Color(0xffFFF09C),
                                onChanged: (bool newValue) {
                                        setState(() {
                                          a = newValue;

                                        reassemble();
                                                   });
                                }),
                            Container(
                              margin: EdgeInsets.only(left: 10,),
                              width: 600,
                              child: Row(children: <Widget>[
                                Checkbox(
                                    value: b,
                                    activeColor: Color(0xffFFF09C),
                                    onChanged: (bool newValue) {
                                      setState(() {
                                        b = newValue;

                                        reassemble();
                                      });
                                    }),
                          ]),
                        ),
    ]
                ),
                        ),

              ],
            ),
                Container(
                  height: 50,
                  //width: MediaQuery.of(context).size.width * 0.9,
                  width: 300,

                  child: RaisedButton(
                    onPressed: () {
                    },
                    child: const Text(
                      'Adicionar',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xffBBBBBB),
                        fontFamily: 'TitilliumWeb',
                      ),
                    ),
                    color: Color(0xffFFF09C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
          ],
          ),
        ),
      ),
      ),
    );
  }
}

