import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final IconData icon;
  final Function onPress;

  PinterestButton(this.icon, this.onPress);
}

class PinterestMenu extends StatelessWidget {
  final List<PinterestButton> items = [
    PinterestButton(Icons.pie_chart, () => print("pie_chart")),
    PinterestButton(Icons.search, () => print("search")),
    PinterestButton(Icons.notifications, () => print("notifications")),
    PinterestButton(
        Icons.supervised_user_circle, () => print("supervised_user_circle")),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _MenuModel(), child: _createMenu(items));
  }
}

Widget _createMenu(List<PinterestButton> items) {
  return Container(
        width: 250,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(100)),
            boxShadow: [
              BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
            ]),
        child: _menuButton(items));
}

Row _menuButton(List<PinterestButton> items) {
  final List<_MenuBItem> icons = [];

  int index = 0;
  for (var item in items) {
    var iB = _MenuBItem(index, item);
    icons.add(iB);
    index++;
  }

  return Row(
    children: icons,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  );
}

class _MenuBItem extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _MenuBItem(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSelect = Provider.of<_MenuModel>(context).itemSeleccionado;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado = index;
        item.onPress();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSelect == index) ? 33 : 28,
          color: (itemSelect == index) ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _indexSelect = 0;
  int get itemSeleccionado => _indexSelect;
  set itemSeleccionado(int index) {
    _indexSelect = index;
    notifyListeners();
  }
}
