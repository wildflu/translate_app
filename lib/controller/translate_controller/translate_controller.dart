

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translateapp/controller/sql_controller/db_controller.dart';
import 'package:translateapp/repository/translate_repository.dart';

class TranslateController extends GetxController {

  DBController dbController = Get.put(DBController());
  bool isInLoad = false;

  String resourceLang = 'en';
  String targetLang = 'ar';
  TextEditingController message = TextEditingController();

  final Translate translateRepositoy = Translate();
  List<String> translateLangs = [];

  navigateToConvertation(int id) {
    dbController.navigateToOldConvertation(id);
    update();
  }

  translateToMe() async {
    if (message.text == '') return ;
    isInLoad = true;
    update();
    await dbController.translateMassage(message.text, 0);
    final String repond = await translateRepositoy.translateText(message.text, resourceLang, targetLang);
    await dbController.translateMassage(repond, 1);
    isInLoad = false;
    message.clear();
    update();
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