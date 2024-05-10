import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  //rxn aceita nulo e  vai ficar escultando as alteraões do MessageModel
  void messagesListener(Rxn<MessagesModel> message) {
    //implementação
    //ever vai executar uma funçao

    ever<MessagesModel?>(message, (model) {
      //model diferente de null pq ele pode ser passado nulo
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor:
              // (model.type == MessageType.error ? Colors.red : Colors.blue)
              model.type.color(),
        );
      } else {}
    });
  }
}

class MessagesModel {
  final String title;
  final String message;
  final MessageType type;

  MessagesModel({
    required this.title,
    required this.message,
    required this.type,
  });
  MessagesModel.error({
    required this.title,
    required this.message,
  }) : type = MessageType.error;
  MessagesModel.info({
    required this.title,
    required this.message,
  }) : type = MessageType.info;
}

enum MessageType { error, info }

extension MessageTypeExtension on MessageType {
  Color color() {
    // Switch (MessageType){}
    // ou
    switch (this) {
      case MessageType.error:
        //red 800 nao existir entao retorna nulo se for nulo pode retornar o red padrao
        return Colors.red[600] ?? Colors.red;
        
      case MessageType.info:
        return Colors.blue[200] ?? Colors.blue;
    }
  }
}
