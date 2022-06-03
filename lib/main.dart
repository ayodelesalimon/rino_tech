import 'package:flutter/material.dart';

import 'screens/auth/login.dart';
import 'screens/onboard/onboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handova',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: OnBoardScreen(),
    );
  }
}

