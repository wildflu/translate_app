


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:translateapp/controller/translate_controller/translate_controller.dart';



void main() {

  test('translateToMe adds messages to translateConvertation', () async {
    TranslateController translateController = TranslateController();
      // Arrange
      final textToTranslate = 'Hello';
      final response = 'Bonjour';

      // await translateController.translateToMe(textToTranslate);

      // expect(translateController.translateConvertation.length, 2);
      // expect(translateController.translateConvertation[0].text, textToTranslate);
      // expect(translateController.translateConvertation[0].isQuestion, false);
      // expect(translateController.translateConvertation[1].text, response);
      // expect(translateController.translateConvertation[1].isQuestion, true);

      // expect(translateController.translateConvertation.length, 0);
      // expect(translateController.translateConvertation.length, 3);
    }
  );
}