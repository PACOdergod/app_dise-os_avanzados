import 'package:flutter/material.dart';


class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          _MainScroll(),

          Positioned(
            bottom: 0,
            right: 0,
            child: _BotonNewList())

        ],
      )
    );
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return GestureDetector(
      child: Container(
        width: size.width * 0.9,
        height: 70,
        alignment: Alignment.center,
        // padding: EdgeInsets.all(10),

        decoration: BoxDecoration(
          color: Color(0xffED6762),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50))
        ),

        child: Text('NEW', style: TextStyle( 
          color: Colors.white, 
          fontWeight: FontWeight.bold, 
          fontSize: 25,
          letterSpacing: 4)),
      ),

      onTap: null,
    );
  }
}

class _MainScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [

        SliverPersistentHeader(
          floating: true,
          delegate: _CustomSliverHeaderDelegate(155, 170, 
            Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: _Titulo())
          )
        ),

        SliverList(
          delegate: SliverChildListDelegate([...items, SizedBox(height: 50)])
        )

      ],
    );
  }
}

class _CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  _CustomSliverHeaderDelegate(this.minHeight, this.maxHeight, this.child);

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand( child: child );
  }

  @override
  double get maxExtent => this.maxHeight;

  @override
  double get minExtent => this.minHeight;

  @override
  bool shouldRebuild(_CustomSliverHeaderDelegate oldDelegate) {
    return  this.maxHeight != oldDelegate.maxHeight ||
            this.minHeight != oldDelegate.minHeight ||
            this.child != oldDelegate.child;
  }

}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SafeArea(child: SizedBox(height: 10)),

        Container(
          margin: EdgeInsets.symmetric( horizontal: 30 ),
          child: Text('New', style: TextStyle(
            color: Color(0xff532128), fontSize: 50))
        ),

        Container(
          child: Text('List', style: TextStyle( 
            color: Color(0xffD93A30), 
            fontSize: 50, 
            fontWeight: FontWeight.bold
          )),
        ),

      ],
    );
  }
}

final items = [
  _ListItem( 'Orange', Color(0xffF08F66) ),
  _ListItem( 'Family', Color(0xffF2A38A) ),
  _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
  _ListItem( 'Books', Color(0xffFCEBAF) ),
  _ListItem( 'Orange', Color(0xffF08F66) ),
  _ListItem( 'Family', Color(0xffF2A38A) ),
  _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
  _ListItem( 'Books', Color(0xffFCEBAF) ),
  _ListItem( 'Orange', Color(0xffF08F66) ),
  _ListItem( 'Family', Color(0xffF2A38A) ),
  _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
  _ListItem( 'Books', Color(0xffFCEBAF) ),
  _ListItem( 'Orange', Color(0xffF08F66) ),
  _ListItem( 'Family', Color(0xffF2A38A) ),
  _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
  _ListItem( 'Books', Color(0xffFCEBAF) ),
];

class _ListItem extends StatelessWidget {
  const _ListItem( this.title, this.color );

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      child: Text(this.title, style: TextStyle( 
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }
}