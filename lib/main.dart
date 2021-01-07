import 'package:circular_progress/src/pages/circular_prog_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'circular_prog',
      routes: {
        'circular_prog': (BuildContext context) => CircularProgPage(),
      },
    );
  }
}
