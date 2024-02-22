


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:translateapp/presontation/components/langs_list_component.dart';

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
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Expanded(
                child: ListView(
                    shrinkWrap: true,
                    children: const [
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                    ],
                ),
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