

import 'dart:io';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:translateapp/controller/translate_controller/translate_controller.dart';


class TextFromImage extends GetxController{

  final TranslateController translateController = Get.find();

  String textFromImage = "";
  File ?fi;

  Future<void> getImage(bool method) async {
    final ImagePicker picker = ImagePicker();
    var file;
    if(method) {
      file = await picker.pickImage(source: ImageSource.gallery);
    }else {
      file = await picker.pickImage(source: ImageSource.camera);
    }
    if(file != null) {
      fi = File(file.path);
      reconiseText(File(file.path));
      update();
    }
  }

  void reconiseText(File? f)async {
    final inputimage = InputImage.fromFilePath(f!.path);
    final textdetect = GoogleMlKit.vision.textRecognizer();

    RecognizedText rectext = await textdetect.processImage(inputimage);
    textdetect.close();
    textFromImage = "";
    for(TextBlock tb in rectext.blocks) {
      for(TextLine tl in tb.lines) {
        textFromImage += "${tl.text} \n";
      }
    }
    translateController.message.text = textFromImage;
    update();
  }
}