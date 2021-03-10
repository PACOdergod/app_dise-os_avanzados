import 'package:circular_progress/src/widgets/radia_progress.dart';
import 'package:flutter/material.dart';

class GraficasCirculares extends StatefulWidget {
  @override
  _GraficasCircularesState createState() => _GraficasCircularesState();
}

class _GraficasCircularesState extends State<GraficasCirculares> {
  double porcentaje = 20.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              porcentaje += 10;

              if (porcentaje > 100) porcentaje = 0;
            });
          }
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: RadialProgress(procentaje: porcentaje,colorPrimario: Colors.green),
        )
      ),
      
    );
  }
}
