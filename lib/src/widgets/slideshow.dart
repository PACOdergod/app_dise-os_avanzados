// import 'package:circular_progress/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _SliderModel with ChangeNotifier {
  double _currentPage = 0;

  double get currentPage => this._currentPage;
  set currentPage(double pagina) {
    this._currentPage = pagina;
    notifyListeners();
  }

  late Color color;
  Color get colorP => color;

  late Color colorSec;
  Color get colorS => colorSec;

  late double _tamAct;
  double get tamAct => _tamAct;
  late double _tamSec;
  double get tamSec => _tamSec;
}

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final Color color;
  final Color colorSec;
  final double tamPri;
  final double tamSec;

  Slideshow({
    required this.slides,
    this.color = Colors.blue,
    this.colorSec = Colors.grey,
    this.tamPri = 15,
    this.tamSec = 15,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SliderModel(),
      child: Center(child: Builder(
        builder: (BuildContext context) {
          Provider.of<_SliderModel>(context).color = this.color;
          Provider.of<_SliderModel>(context).colorSec = this.colorSec;

          Provider.of<_SliderModel>(context)._tamAct = this.tamPri;
          Provider.of<_SliderModel>(context)._tamSec = this.tamSec;

          return Column(
            children: [
              Expanded(child: _Slides(this.slides)),
              _Dots(this.slides.length)
            ],
          );
        },
      )),
    );
  }
}

// TODO: cuando son muchos widgets aparece un erros

class _Dots extends StatelessWidget {
  final GlobalKey dotsKey = GlobalKey();
  final int cantidad;

  _Dots(this.cantidad);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Row(
        key: dotsKey,
        children: List.generate(this.cantidad, (index) => _Punto(index)),
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}

class _Punto extends StatelessWidget {
  final int index;

  _Punto(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    final sm = Provider.of<_SliderModel>(context);

    double tam;
    Color color;

    if (sm._currentPage.round() == index) {
      // este punto es el mismo del index de la imagen
      tam = sm.tamAct;
      color = sm.colorP;
    } else {
      tam = sm.tamSec;
      color = sm.colorS;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.all(10),
      height: tam,
      width: tam,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      // print("${pageViewController.page}");
      // Actulizar la instancia de mi clase}
      // cuando esta en initState el listen debe ser false
      Provider.of<_SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print("el tamaño es:${widget.slides.length}");
    return Container(
      child: PageView(
          controller: pageViewController,
          children: widget.slides.map((e) => _Slide(e)).toList()),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: slide);
  }
}
