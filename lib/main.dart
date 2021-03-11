// import 'package:circular_progress/src/labs/circular_prog_page.dart';
// import 'package:circular_progress/src/pages/graficas_circulares_page.dart';
import 'package:circular_progress/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SlideShowPage(),
      // initialRoute: 'circular_prog',
      // routes: {
      //   'circular_prog': (BuildContext context) => GraficasCirculares(),
      // },
    );
  }
}
