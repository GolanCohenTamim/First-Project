import 'package:flutter/material.dart';

import 'package:flutter_social_ui/screens/login_screen.dart';

void main() => runApp(MyApp());


// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Color MyColor = const Color(0xFF1877F2);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Social',
      theme: ThemeData(
          primaryColor: Colors.tealAccent[700],
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: MyColor)),
      home: LoginScreen(),
    );
  }
}
