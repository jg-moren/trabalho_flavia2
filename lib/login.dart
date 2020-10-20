import 'package:flutter/material.dart';

import 'formulario.dart';
class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFF09C),
        title: Text("Fazer o Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _body(context),
      ),
    );
  }
  String _validateLogin(String text){
    if(text.isEmpty){
      return "Informe o login";
    }
    return null;
  }
  String _validateSenha(String text){
    if(text.isEmpty){
      return "Informe a senha";
    }
    return null;
  }
  _body(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            textFormFieldLogin(),
            textFormFieldSenha(),
            containerButton(context)
          ],
        )
    );
  }
  TextFormField textFormFieldLogin() {
    return TextFormField(
        controller: _tLogin,
        validator: _validateLogin,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            labelText: "Login",
            labelStyle: TextStyle(fontSize:20.0, color: Colors.black),
            hintText: "Informe a senha"
        )
    );
  }
  TextFormField textFormFieldSenha() {
    return TextFormField(
        controller: _tSenha,
        validator: _validateSenha,
        obscureText: true,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            labelText: "Senha",
            labelStyle: TextStyle(fontSize:20.0, color: Colors.black),
            hintText: "Informe a senha"
        )
    );
  }
  Container containerButton(BuildContext context) {
    return  Container(
      height: 50,
      //width: MediaQuery.of(context).size.width * 0.9,
      width: 300,
      margin: EdgeInsets.only(top: 350),

      child: RaisedButton(
        onPressed: () {
          _onClickLogin(context);
        },
        child: const Text(
          'Logar',
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
    );
  }
  _onClickLogin(BuildContext context) {
    final login = _tLogin.text;
    final senha = _tSenha.text;
    print("Login: $login , Senha: $senha " );
    if(!_formKey.currentState.validate())  {
      return;
    }
    if(login.isEmpty || senha.isEmpty) {
      showDialog(context: context,
        builder: (context){
          return AlertDialog(
              title:Text("Erro"),
              content: Text("Login e/ou Senha inválido(s)"),
              actions : <Widget>[
                FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                )
              ]
          );
        },
      );
    }
  }
}