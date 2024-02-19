
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:translateapp/controller/translate_controller/translate_controller.dart';



class SpeechToTextController extends GetxController{
  final TranslateController translateController = Get.find();
  final stt.SpeechToText speech = stt.SpeechToText();
  bool isListening = false;
  String text = '';



  void listen() async {
    if (!isListening) {
      bool available = await speech.initialize(
        onStatus: (status){
          if(status == 'done') {
            isListening = false;
            update();
          }
          print('onStatus: $status');
        },
        onError: (errorNotification) => print('onError: $errorNotification'),
      );
      if (available) {
        isListening = true;
        speech.listen(
          onResult: (result) {
            translateController.message.text = result.recognizedWords;
            text = result.recognizedWords;
          },
        );
        update();
      }
    } else {
      isListening = false;
      speech.stop();
    }
    update();
  }
}

