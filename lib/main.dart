import 'package:cv/Screen/datascreen.dart';
import 'package:cv/Screen/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Resume(),
        'datascreen':(context) => SaveData(),
      },

    )
  );
}

