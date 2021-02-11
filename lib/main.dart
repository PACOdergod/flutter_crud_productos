import 'package:flutter/material.dart';
import 'package:flutter_productos/src/bloc/provider.dart';
import 'package:flutter_productos/src/pages/home_page.dart';
import 'package:flutter_productos/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context)=> HomePage()
      },
    ));
  }
}
