import 'package:flutter/material.dart';
import 'package:pizzanove/pages/login.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Define o background branco
        // useMaterial3: true, // Remove this line if not using Material 3
      ),
      home: LoginScreen(),
    );
  }
}
