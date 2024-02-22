
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:translateapp/controller/translate_controller/translate_controller.dart';



class LangsListComponent extends StatelessWidget {
  const LangsListComponent({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TranslateController>(
      init: TranslateController(),
      builder: (controller) {
        return SizedBox(
          height: 30,
          child: Row(
            children: [
              SizedBox(
                width: 40,
                child: Text(label,  style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),)),
              const Gap(10),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.translateLangs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: controller.translateLangs[index] == (label == 'From'? controller.resourceLang: controller.targetLang) ? Colors.white : const Color(0xFF37CEFF),
                        border: Border.all(width: 1, color: controller.translateLangs[index] == (label == 'From'? controller.resourceLang: controller.targetLang) ? Colors.white     : Colors.white)
                      ),
                      child: InkWell(
                        onTap: (){
                          if(label == 'From'){
                            controller.setResource(controller.translateLangs[index]);
                          }else{
                            controller.setTarget(controller.translateLangs[index]);
                          }
                        },
                        child: Center(
                          child: Text(
                            controller.translateLangs[index], 
                            style: TextStyle(
                              color: controller.translateLangs[index] == (label == 'From'? controller.resourceLang: controller.targetLang) ? Colors.blue : Colors.white,
                              fontSize: 15, 
                              fontWeight: FontWeight.w300
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}