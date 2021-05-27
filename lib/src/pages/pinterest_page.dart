import 'package:circular_progress/src/widgets/pinterest_menu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => new _MenuModel(),
        child: Stack(
          children: [PinterestGrid(), _MenuLocation()],
        ),
    ));
  }
}

class _MenuLocation extends StatefulWidget {
  @override
  __MenuLocationState createState() => __MenuLocationState();
}
class __MenuLocationState extends State<_MenuLocation> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: Provider.of<_MenuModel>(context).mostrar ? 1 : 0,
              child: PinterestMenu())),
    );
  }
}


class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}
class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(100, (index) => index);
  var controller = new ScrollController();
  double scrollAnt = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.offset > scrollAnt && controller.offset >0) {
        // ha hecho un scroll hacia abajo
        // debe ocultar el menu
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        // mostrar menu
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }

      scrollAnt = controller.offset;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
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
    return Container(
      margin: EdgeInsets.all(5),
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


class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;
  set mostrar(bool condition) {
    _mostrar = condition;
    notifyListeners();
  }
}