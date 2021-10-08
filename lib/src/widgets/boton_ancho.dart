import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonAncho extends StatelessWidget {

  final IconData icon;
  final String texto;
  final void Function() onPress;
  final Color color1, color2;

  const BotonAncho({
    required this.texto, 
    required this.onPress,
    this.icon = Icons.add,
    this.color1 = const Color(0xff6989f5), 
    this.color2 = const Color(0xff906EF5),
  });

  // FontAwesomeIcons.carCrash


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
    
      child: Stack(children: [
        _BotonAnchoBackground(color1, color2, icon),
    
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 140,width: 40,),
            
            FaIcon(icon, size: 40, color: Colors.white,),
            SizedBox(width: 20,),
    
            Expanded(child: Text(this.texto, style: TextStyle(color: Colors.white, fontSize: 18),)),
    
            FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white,),
            SizedBox(width: 40,),
          ],
        )
      ],),
    );
  }
}

class _BotonAnchoBackground extends StatelessWidget {

  final Color color1, color2;
  final IconData icon;

  const _BotonAnchoBackground(this.color1, this.color2, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),

        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(icon, size: 150, 
                color: Colors.white.withOpacity(0.2),)
            ),
          ], 
        ),
      ),

      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        
        color: Colors.amber,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset(4,5), blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(15),

        gradient: LinearGradient(colors: [color1, color2 ])
      ),
    );
  }
}