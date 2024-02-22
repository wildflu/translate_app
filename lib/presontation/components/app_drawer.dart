


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:translateapp/controller/sql_controller/db_controller.dart';
import 'package:translateapp/controller/translate_controller/translate_controller.dart';
import 'package:translateapp/presontation/components/langs_list_component.dart';
import 'package:translateapp/presontation/pages/home_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xFF37CEFF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 50,),
                  Gap(10),
                  Text("walidcode0@gmail.com", style: TextStyle(fontSize: 15, color: Colors.white),)
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<TranslateController>(
                  init: TranslateController(),
                  builder: (controller) {
                    return ListView.builder(
                    itemCount: controller.dbController.convers.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          controller.navigateToConvertation(controller.dbController.convers[index]['id']);
                          zoomController.close!();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 3),
                          padding: const EdgeInsets.all(5),
                          height: 49,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.dbController.convers[index]['title'].toString().length > 15
                                ? controller.dbController.convers[index]['title'].toString().substring(0,15)
                                : controller.dbController.convers[index]['title'].toString(),
                                style: const TextStyle(color: Colors.white),),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.edit,size: 15,color: Colors.white,))
                            ],
                          ),
                        ),
                      );
                    },
                  );
                  }),
                ),
              ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Translate', style: TextStyle(fontSize: 17, color: Colors.white),),
                  Gap(10),
                  LangsListComponent(label: 'From',),
                  Gap(5),
                  LangsListComponent(label: 'To'),
                  Gap(50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}