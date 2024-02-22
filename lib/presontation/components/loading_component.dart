

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingIndicator(
      indicatorType: Indicator.ballClipRotateMultiple,
      colors: [Colors.white],
      strokeWidth: 2,            
      // backgroundColor: Colors.black,
      pathBackgroundColor: Colors.black,
    );
  }
}