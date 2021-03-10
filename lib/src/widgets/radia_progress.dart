import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  // RadialProgress({Key key}) : super(key: key);

  final procentaje;

  RadialProgress({this.procentaje});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Text("${widget.procentaje}"),
      width: double.infinity,
      height: double.infinity,

      child: CustomPaint(painter: _MiRadialPainter(widget.procentaje),),
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
