


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:translateapp/controller/translate_controller/translate_controller.dart';
import 'package:gap/gap.dart';
import 'package:translateapp/presontation/components/langs_list_component.dart';

class HomPage extends StatelessWidget {
  const HomPage({super.key});
  @override
  Widget build(BuildContext context) {
    TranslateController controller = Get.put(TranslateController());
    return Scaffold(
      body: Obx(() {
        return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.translateConvertation.length,
                  itemBuilder: (context, index) {
                    bool isquestion = controller.translateConvertation[index].isQuestion;
                    return Align(
                      alignment: isquestion? Alignment.topRight : Alignment.topLeft,
                      child: Text(
                        controller.translateConvertation[index].text, 
                        style: TextStyle(color: isquestion ? Colors.red:Colors.blue),
                      )
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const LangsListComponent(label: 'From'),
                    const Gap(5),
                    const LangsListComponent(label: 'To'),
                    const Gap(10),
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        children: [
                          Expanded(flex: 6,child: TextFormField(
                            controller: controller.message,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'your text here',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                              suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.send))
                            ),
                          )),
                          const Gap(5),
                          Expanded(flex:1,child: IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                            ),
                            onPressed: (){
                            controller.translateToMe();
                          }, icon: const Icon(Icons.mic))),
                          const Gap(5),
                          Expanded(flex:1,child: IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                            ),
                            onPressed: (){
                            controller.translateToMe();
                          }, icon: const Icon(Icons.image))),
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