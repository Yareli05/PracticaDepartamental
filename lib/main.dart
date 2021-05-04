import 'package:flutter/material.dart';
import 'package:widgets/pages/home_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
