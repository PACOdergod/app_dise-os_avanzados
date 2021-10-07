import 'package:animate_do/animate_do.dart';
import 'package:circular_progress/src/widgets/boton_ancho.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}


class EmergencyPage extends StatelessWidget {

  final items = <ItemBoton>[
    ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
    ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
    ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
    ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
  ];

  @override
  Widget build(BuildContext context) {

    List botonesAnchos = List.generate(items.length, (int i){
      return FadeInLeft(
        duration: Duration(milliseconds: 1000),

        delay: Duration(milliseconds: 200),
        
        child: BotonAncho(
          texto: items[i].texto, 
          icon: items[i].icon,
          color1: items[i].color1,
          color2: items[i].color2,
          onPress: (){print("boton");}
        ),
      );
    });


    return Scaffold(
      body: Stack(children: [

        Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: 250,),
              ...botonesAnchos
            ]
          ),
        ),

        IconHeader(),

      ])
    );
  }
}


class IconHeader extends StatelessWidget {

  final fontColor = Colors.white.withOpacity(0.7);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [

        _IconHeaderBackground(),

        Positioned(
          top: -50,
          left: -70,
          child: 
            FaIcon(FontAwesomeIcons.plus, size: 250, color: Colors.white.withOpacity(0.2))
        ),

        Column(children: [
          SizedBox(height: 80,width: double.infinity),

          Text("Haz solicitado", style: TextStyle( fontSize: 20, color: fontColor )),

          SizedBox(height: 20,),

          Text("Asistencia medica", style: 
            TextStyle( fontSize: 20, color: fontColor, fontWeight: FontWeight.bold )),

          FaIcon(FontAwesomeIcons.plus, size: 80, color: Colors.white)
        ],),

        Positioned(
          right: -10,
          top: 30,
          child: RawMaterialButton(
            child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white,),
            onPressed: (){},
            shape: CircleBorder(),
            padding: EdgeInsets.all(15),
          )
        ),

    ],);
  }
}

class _IconHeaderBackground extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff526BF6), Color(0xff67ACF2)]
        )
      ),
    );
  }
}