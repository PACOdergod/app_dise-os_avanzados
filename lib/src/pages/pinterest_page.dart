import 'package:circular_progress/src/widgets/pinterest_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PinterestGrid(),
        Positioned(
          bottom: 20,
          width: MediaQuery.of(context).size.width,
          child: Center(child: PinterestMenu()),
        )
      ],)
    );
  }
}

class PinterestGrid extends StatelessWidget {
  final List<int> items = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}
