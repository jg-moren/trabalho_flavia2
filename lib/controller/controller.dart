import 'package:flutter/material.dart';
import 'package:tela_inicial/view/add_checkpoint.dart';
import 'package:tela_inicial/view/add_contato.dart';
import 'package:tela_inicial/view/tela_principal.dart';
import '../view/login.dart';
import '../model/model.dart';

class controller_inicio {
  controller_inicio.proxima(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
  }
}

class controller_login {
  controller_login.proxima(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => tela_principal()));
  }
  controller_login.voltar(context){
    Navigator.pop(context);
  }

  static bool setLogin(_nome,_senha){
    if (_nome != "" && _senha != ""){
      model.setLogin(_nome, _senha);
      return true;
    }else{
      return false;
    }
  }
}

class controller_contato{
  controller_contato.add(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => add_contato()));
  }
}
class controller_add_contato {
  controller_add_contato.proxima(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => tela_principal()));
  }
  controller_add_contato.voltar(context){
    Navigator.pop(context);
  }

  static bool boolContato(_contato,_telefone){
    if (_contato != "" && _telefone != ""){
      return true;
    }else{
      return false;
    }
  }
  static setContato(_contato,_telefone){
    if (boolContato(_contato,_telefone)){
      model.addContato(_contato, _telefone);
    }
  }
}

class controller_checkpoint{
  controller_checkpoint.add(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => add_checkpoint()));
  }
}

class controller_add_checkpoint {
  controller_add_checkpoint.proxima(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => tela_principal()));
  }
  controller_add_checkpoint.voltar(context){
    Navigator.pop(context);
  }

  static bool boolCheckpoint(_marcador,_endereco,_contato,_mensagem){
    if (_marcador !="" && _endereco !="" && _contato !="" && _mensagem !=""){
      return true;
    }else{
      return false;
    }
  }
  static setCheckpoint(_marcador,_endereco,_contato,_mensagem){
    if (boolCheckpoint(_marcador,_endereco,_contato,_mensagem)){
      model.addCheckpoint(_marcador,_endereco,_contato,_mensagem);
    }
  }

}
