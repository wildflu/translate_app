

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translateapp/controller/sql_controller/db_controller.dart';
import 'package:translateapp/presontation/pages/sqlite_test/all_chats.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        actions: [
          IconButton(onPressed: (){Get.to(()=> const AllChats());}, icon: const Icon(Icons.all_inbox))
        ],
      ),
      body: GetBuilder<DBController>(
        init: DBController(),
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.convertationMasseges.length,
                  itemBuilder: (context, index) {
                    return Text(controller.convertationMasseges[index]['text']);
                  },
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'yourMassege',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(width: 1, color: Colors.red)
                          )
                        ),
                      ),
                    ),
                    IconButton(onPressed: ()async{
                        // await controller.translateMassage();
                      }, 
                      icon: Icon(Icons.send)
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}