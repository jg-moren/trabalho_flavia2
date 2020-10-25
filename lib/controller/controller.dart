import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tela_inicial/view/add_checkpoint_contatos.dart';
import 'package:tela_inicial/view/add_checkpoint_mapa.dart';
import 'package:tela_inicial/view/add_checkpoint_mensagem.dart';
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => add_checkpoint_mapa()));
  }
}

class controller_add_checkpoint{
  static salvar(){
    model.addCheckpoint();
  }
}
class controller_add_checkpoint_mapa {
  controller_add_checkpoint_mapa.proxima(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => add_checkpoint_contato()));
  }
  controller_add_checkpoint_mapa.voltar(context){
    Navigator.pop(context);
  }

   static bool boolCheckpointMapa(LatLng _endereco,String _nome_endereco){
    if(_endereco != ""){
      return true;
    }else{
      return false;
    }

  }
  static setCheckpointMapa(_endereco,_nome_endereco){
  if (boolCheckpointMapa(_endereco,_nome_endereco)){
  model.addCheckpointMapa(_endereco,_nome_endereco);
  }
  }
}

class controller_add_checkpoint_contato {
  controller_add_checkpoint_contato.proxima(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => add_checkpoint_mensagem()));
  }
  controller_add_checkpoint_contato.voltar(context){
    Navigator.pop(context);
  }
  static setCheckpointContato(_id){
      model.addCheckpointContato(_id);
  }
}

class controller_add_checkpoint_mensagem {
  controller_add_checkpoint_mensagem.proxima(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => tela_principal()));
  }
  controller_add_checkpoint_mensagem.voltar(context){
    Navigator.pop(context);
  }

  static bool boolCheckpointMensagem(_marcador,_mensagem){
    if (_marcador !="" &&  _mensagem !=""){
      return true;
    }else{
      return false;
    }
  }
  static setCheckpointMensagem(_marcador,_mensagem){
    if (boolCheckpointMensagem(_marcador,_mensagem)){
      model.addCheckpointMensagem(_marcador,_mensagem);
    }
  }

}
