

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:translateapp/constants/data.dart';

class DBController extends GetxController {
  int ?converId;

  List<Map<String, dynamic>> convers = [] ;
  final DatabaseHelper db = DatabaseHelper();
  TextEditingController textController = TextEditingController();
  List<Map<String, dynamic>> convertationMasseges = [];

  navigateToOldConvertation(int id) {
    getAchatMessages(id);
    converId = id;
    update();
  }

  getAllData() async {
    convers = await db.getConversations();
    update();
  }

  void getAchatMessages(int idConvertation)async{
    convertationMasseges = await db.getMessages(idConvertation);
    update();
  }

  createConvertation()async {
    int convertationId = await db.insertConversation(textController.text.substring(0,5), DateTime.now().millisecondsSinceEpoch);
    converId = convertationId;
    update();
  }

  translateMassage()async {
    if(converId == null){
      await createConvertation();
    }
    await db.insertMessage(converId!, 0, textController.text);
    await db.insertMessage(converId!, 1, '${textController.text} this is the repond');
    await getAllData();
    getAchatMessages(converId!);
    textController.clear();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getAllData();
  }
}