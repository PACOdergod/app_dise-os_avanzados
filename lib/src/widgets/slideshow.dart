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

  Color color;
  Color get colorP => color;


  Color colorSec;
  Color get colorS => colorSec;
}

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final Color color;
  final Color colorSec;

  Slideshow({
    @required this.slides,
    this.color = Colors.blue,
    this.colorSec = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SliderModel(),
      child: Center(child: Builder(
        builder: (BuildContext context) {
          Provider.of<_SliderModel>(context).color = this.color;
          Provider.of<_SliderModel>(context).colorSec = this.colorSec;

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

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.all(10),
      height: 15,
      width: 15,
      decoration: BoxDecoration(
          color: (sm._currentPage.round() == index) ? sm.colorP : sm.colorS,
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
          pageViewController.page;
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
