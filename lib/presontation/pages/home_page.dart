import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:translateapp/controller/img_text_text_controller/img_to_text_controller.dart';
import 'package:translateapp/controller/speech_to_text_controller/speech_text_controller.dart';
import 'package:translateapp/controller/translate_controller/translate_controller.dart';
import 'package:gap/gap.dart';
import 'package:translateapp/presontation/components/app_drawer.dart';


final ZoomDrawerController zoomController = ZoomDrawerController();

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomController,
      menuBackgroundColor: const Color(0xFF37CEFF),
      borderRadius: 24.0,
      showShadow: true,
      angle: 0.0,
      duration: const Duration(milliseconds: 700),
      drawerShadowsBackgroundColor: Colors.grey.shade100,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      mainScreen: const HomePageMain(),
      menuScreen: const AppDrawer(),
    );
  }
}

class HomePageMain extends StatelessWidget {
  const HomePageMain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TranslateController controller = Get.put(TranslateController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){zoomController.toggle!();}, icon: const Icon(Icons.menu)),
        title: const Text("ConvLate"),
      ),
      body: Obx(() {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.translateConvertation.length,
                itemBuilder: (context, index) {
                  bool isquestion =
                      controller.translateConvertation[index].isQuestion;
                  return Align(
                    child: BubbleSpecialThree(
                      text: controller.translateConvertation[index].text,
                      color: isquestion
                          ? const Color(0xFF54B2F9)
                          : const Color(0xFFE8E8EE),
                      tail: false,
                      isSender: isquestion,
                      textStyle: TextStyle(
                          color: isquestion ? Colors.white : Colors.black,
                          fontSize: 16),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // const LangsListComponent(label: 'From'),
                  // const Gap(5),
                  // const LangsListComponent(label: 'To'),
                  // const Gap(10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            flex: 6,
                            child: TextFormField(
                              controller: controller.message,
                                  minLines: null,
                                  maxLines: null,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'your text here',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide.none
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: () =>
                                          controller.translateToMe(),
                                      icon: const Icon(Icons.send))),
                            )),
                        const Gap(5),
                        GetBuilder<SpeechToTextController>(
                          init: SpeechToTextController(),
                          builder: (controllerSpeechText) {
                            return Expanded(
                                flex: 1,
                                child: Container(
                                  height: 48,
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    style: IconButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                    onPressed: () =>
                                        controllerSpeechText.listen(),
                                    icon: controllerSpeechText.isListening
                                        ? const RippleAnimation(
                                            color: Colors.blue,
                                            delay: Duration(milliseconds: 300),
                                            repeat: true,
                                            minRadius: 10,
                                            ripplesCount: 6,
                                            duration:
                                                Duration(milliseconds: 6 * 300),
                                            child: Icon(
                                              Icons.mic,
                                              color: Colors.blue,
                                            ),
                                          )
                                        : Icon(
                                            Icons.mic,
                                            color:
                                                controllerSpeechText.isListening
                                                    ? Colors.blue
                                                    : Colors.black,
                                          ),
                                  ),
                                ));
                          },
                        ),
                        const Gap(5),
                        GetBuilder<TextFromImage>(
                          init: TextFromImage(),
                          builder: (textFromImgcontroller) {
                            return Expanded(
                              flex: 1,
                              child: Container(
                                height: 48,
                                child: IconButton(
                                    style: IconButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                    onPressed: ()=> textFromImgcontroller.getImage(true),
                                    icon: const Icon(Icons.image)
                                  ),
                              )
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
