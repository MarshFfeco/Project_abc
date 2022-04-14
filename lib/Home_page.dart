import 'package:fadba/values/Custom_color.dart';
import 'package:flutter/material.dart';

import 'screens/Login/Login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fadba",
      home: LoginScreen(),
    );
  }
}
