import 'package:flutter/material.dart';
import 'package:tela_inicial/view/contatos.dart';
class estilo{
  static const cor = Color(0xffFFF09C);
}

class model{
  String nome;
  String senha;

  static var Contatos = [];
  static var Checkpoints = [];

  model.setLogin(_nome,_senha){
      nome = _nome;
      senha = _senha;
  }
  model.addContato(_contato,_telefone){
    Contatos.add([_contato,_telefone]);
    print(Contatos);
  }
  model.delContato(int _id){
    Contatos.removeAt( _id);
    print(Contatos);
  }
  model.addCheckpoint(_marcador,_endereco,_contato,_mensagem){
    Checkpoints.add([_marcador,_endereco,_contato,_mensagem]);
    print(Checkpoints);
  }
  model.delCheckpoint(int _id){
    Checkpoints.removeAt( _id);
    print(Checkpoints);
  }
}