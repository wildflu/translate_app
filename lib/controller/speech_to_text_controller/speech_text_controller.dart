
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
        onStatus: (status) => print('onStatus: $status'),
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


// class SpeechToTextComponent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Speech to Text'),
//       ),
//       body: Center(
//         child: SpeechToTextController(),
//       ),
//     );
//   }
// }

// class SpeechToTextController extends StatefulWidget {
//   @override
//   _SpeechToTextControllerState createState() => _SpeechToTextControllerState();
// }

// class _SpeechToTextControllerState extends State<SpeechToTextController> {
//   stt.SpeechToText _speech = stt.SpeechToText();
//   bool _isListening = false;
//   String _text = '';

  // void _listen() async {
  //   if (!_isListening) {
  //     bool available = await _speech.initialize(
  //       onStatus: (status) => print('onStatus: $status'),
  //       onError: (errorNotification) => print('onError: $errorNotification'),
  //     );
  //     if (available) {
  //       setState(() {
  //         _isListening = true;
  //       });
  //       _speech.listen(
  //         onResult: (result) {
  //           setState(() {
  //             _text = result.recognizedWords;
  //           });
  //         },
  //       );
  //     }
  //   } else {
  //     setState(() {
  //       _isListening = false;
  //       _speech.stop();
  //     });
  //   }
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         FloatingActionButton(
//           onPressed: _listen,
//           child: Icon(_isListening ? Icons.mic : Icons.mic_none),
//         ),
//         SizedBox(height: 20.0),
//         Text(_text),
//       ],
//     );
//   }
// }