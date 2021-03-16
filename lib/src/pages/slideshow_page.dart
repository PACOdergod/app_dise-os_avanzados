import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [Expanded(child: _Slides()), _Dots()],
      )),
    );
  }
}

class _Dots extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [_Punto(0), _Punto(1), _Punto(2)],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}

class _Punto extends StatelessWidget {
  final int index;

  _Punto(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 15,
      width: 15,
      decoration:
          BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      print("${pageViewController.page}");
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: [
          _Slide('assets/svgs/1.svg'),
          _Slide('assets/svgs/2.svg'),
          _Slide('assets/svgs/3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  _Slide(this.svg);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: SvgPicture.asset(svg));
  }
}
