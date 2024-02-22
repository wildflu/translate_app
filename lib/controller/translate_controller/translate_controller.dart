

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translateapp/constants/data.dart';
import 'package:translateapp/model/message.dart';
import 'package:translateapp/repository/translate_repository.dart';

class TranslateController extends GetxController {




  String resourceLang = 'en';
  String targetLang = 'ar';
  TextEditingController message = TextEditingController();

  final Translate translateRepositoy = Translate();
  RxList<Message> translateConvertation = <Message>[].obs;
  List<String> translateLangs = [];

  translateToMe() async {
    if (message.text == '') return ;
    addQuestionOrWordToConvertation(message.text, true);
    final String repond = await translateRepositoy.translateText(message.text, resourceLang, targetLang);
    addQuestionOrWordToConvertation(repond, false);
    message.clear();
  }

  bool addQuestionOrWordToConvertation(String text, bool isQues){
    translateConvertation.add(Message(text: text, isQuestion: isQues));
    return true;
  }

  getDispayTranslateLangs() async {
    List<String> langs = extractCodes(await translateRepositoy.fetchLanguages());
    translateLangs = langs;
    update();
  }

  setTarget (String newtarget){
    targetLang = newtarget;
    update();
  }

  setResource (String newResource){
    resourceLang = newResource;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getDispayTranslateLangs();
  }

  List<String> extractCodes(String jsonResponse) {
    List<String> codes = [];
    
    Map<String, dynamic> responseData = jsonDecode(jsonResponse);

    List<dynamic> languagesData = responseData['data']['languages'];

    languagesData.forEach((language) {
      codes.add(language['code']);
    });
    return codes;
  }
}