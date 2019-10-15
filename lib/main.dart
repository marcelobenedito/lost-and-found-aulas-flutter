import 'package:flutter/material.dart';
import 'package:lost_and_found/views/sign_in_page.dart';
import 'package:lost_and_found/views/sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Achados e Perdidos',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        SignInPage.routeName: (BuildContext context) => new SignInPage(),
        SignUpPage.routeName: (BuildContext context) => new SignUpPage(),
      },
      home: SignInPage(),
    );
  }
}