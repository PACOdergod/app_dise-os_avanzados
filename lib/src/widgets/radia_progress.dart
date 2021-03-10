import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  // RadialProgress({Key key}) : super(key: key);

  final procentaje;

  RadialProgress({this.procentaje});

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {
    super.initState();
    porcentajeAnterior = widget.procentaje;

    controller =
        new AnimationController(vsync: this, duration: Duration(milliseconds:200));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.procentaje - porcentajeAnterior;
    porcentajeAnterior = widget.procentaje;

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
            return Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MiRadialPainter((widget.procentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value)),
            ),
          );
        });
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
