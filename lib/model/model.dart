import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tela_inicial/view/contatos.dart';
class estilo{
  static const cor = Color(0xffFFF09C);
}

class model{
  String nome;
  String senha;

  static var Contatos = [];
  static var Checkpoints = [];

  static String marcador;
  static LatLng endereco;
  static String nome_endereco;
  static String contato;
  static String mensagem;


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
  model.addCheckpoint(){
    Checkpoints.add([marcador,[endereco,nome_endereco],contato,mensagem]);
    print(Checkpoints);
    marcador = null ;
    endereco = null ;
    nome_endereco = null ;
    contato = null ;
    mensagem = null ;
    print(Checkpoints);
  }

  model.delCheckpoint(int _id){
    Checkpoints.removeAt( _id);
    print(Checkpoints);
  }

  model.addCheckpointMapa(_endereco,_nome_endereco){
    endereco = _endereco;
    nome_endereco = _nome_endereco;
    print(endereco);
    print(nome_endereco);
  }
  model.addCheckpointContato(_id){
    contato = Contatos[_id][0];
    print(contato);
  }

  model.addCheckpointMensagem(_marcador,_mensagem){
    marcador = _marcador;
    mensagem = _mensagem;
  }
}