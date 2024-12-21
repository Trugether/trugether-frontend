import 'package:flutter/material.dart';
import 'package:trugether_frontend/login/screens/jio_savaan_login%20screen.dart';
import 'package:trugether_frontend/login/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
