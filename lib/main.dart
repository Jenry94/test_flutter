import 'package:flutter/material.dart';
import 'package:prueba_flutter/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      home: Home(),
    );
  }
}

ThemeData theme(){
  return ThemeData(
    unselectedWidgetColor: Colors.amber,
    primaryColor: Colors.grey
  );
}

