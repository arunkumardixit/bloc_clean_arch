import 'package:bloc_clean_arch/config/component/round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
               Icons.cloud_off,
            color: Colors.red,
            size: 50,
           ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text("No internet connection.\nPlease try again")),
          ),
          SizedBox(height: 20,),
          RoundButton(onPress: onPress,title: "Retry",)

        ],
      ),
    );
  }
}
