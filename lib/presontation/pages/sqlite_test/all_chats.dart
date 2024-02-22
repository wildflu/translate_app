


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translateapp/controller/sql_controller/db_controller.dart';
import 'package:translateapp/presontation/pages/sqlite_test/chat_page.dart';

class AllChats extends StatelessWidget {
  const AllChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DBController>(
        init: DBController(),
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.convers.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  controller.navigateToOldConvertation(controller.convers[index]['id']);
                  Get.to(() => const LoginPage());
                },
                child: Card(
                  child: Center(
                    child: Text(controller.convers[index]['title']),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}