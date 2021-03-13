import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        children: [
          Expanded( child: _Slides() ),
          _Dots()
        ],
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
        children: [_Punto(),_Punto(),_Punto()],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}

class _Punto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        color: Colors.deepPurple, 
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
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
