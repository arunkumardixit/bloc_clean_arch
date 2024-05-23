
import 'package:flutter/material.dart';

class Utils {

 static void showSnackBar(BuildContext context,String text) {
    SnackBar snackBar = SnackBar(
      content: Text(text,
          style: const TextStyle(fontSize: 20)),
      backgroundColor: Colors.indigo,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}