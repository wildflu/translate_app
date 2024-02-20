


import 'package:flutter/widgets.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF37CEFF),
              const Color(0xFF37CEFF).withOpacity(0.1),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter
        ),
      ),
    );
  }
}