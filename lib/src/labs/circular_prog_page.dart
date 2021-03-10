import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgPage extends StatefulWidget {
  @override
  _CircularProgPageState createState() => _CircularProgPageState();
}

class _CircularProgPageState extends State<CircularProgPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  double porcentaje = 10;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    controller.addListener(() {
      porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value);
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circular'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ac_unit),
          backgroundColor: Colors.purple,
          onPressed: () {
            setState(() {
              porcentaje = nuevoPorcentaje;
              nuevoPorcentaje += 10;
              if (nuevoPorcentaje > 100) {
                nuevoPorcentaje = 0;
                porcentaje = 0;
              }

              controller.forward(from: 0.0);
            });
          }),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(2),
          width: 300,
          height: 300,
          // color: Colors.amber,
          child: CustomPaint(
            painter: _MiRadialPainter(porcentaje),
          ),
        ),
      ),
    );
  }
}

class _MiRadialPainter extends CustomPainter {
  double porcentaje;

  _MiRadialPainter(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height * 0.5);

    double radio = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radio, lapiz);

    //arco
    final lapizArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    // parte que se debe llenar

    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, lapizArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
