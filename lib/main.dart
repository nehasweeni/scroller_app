import 'package:flutter/material.dart';
import 'package:scroller/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Gilroy'),
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Scroller',
      home: HomePage(),
    );
  }
}
