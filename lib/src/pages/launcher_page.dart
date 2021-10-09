import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:circular_progress/src/routes/routes.dart' as Routes;
import 'package:circular_progress/src/theme/theme.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Diseños en flutter'),
      ),

      body: _listaOpciones(context),

      drawer: _MenuPrincipal(),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeProvider>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    return Drawer(
      child: Container(
        child: Column(
          children: [

            SafeArea(child: SizedBox(height: 0)),
    
            Container(
              padding: EdgeInsets.all(20),
              height: 200,
              width: double.infinity,
              child: CircleAvatar(
                backgroundColor: accentColor,
                child: Text('pc', style: TextStyle(fontSize: 50),),
              ),
            ),

            Expanded(child: _listaOpciones(context)),

            ListTile(
              leading: Icon( 
                Icons.lightbulb_outline, 
                color: accentColor,),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                activeColor: Colors.green,
                value: appTheme.darkTheme, 
                onChanged: ( value )=> appTheme.darkTheme = value,
              ),
            ),

            ListTile(
              leading: Icon( Icons.add_to_home_screen, 
              color: accentColor,),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                activeColor: Colors.blue,
                value: appTheme.customTheme,
                onChanged: ( value )=> appTheme.customTheme = value
              ),
            ),

            SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}

Widget _listaOpciones( BuildContext context ) {

  final appTheme = Provider.of<ThemeProvider>(context).currentTheme;

  return ListView.separated(
    physics: BouncingScrollPhysics(),
    separatorBuilder: ( context, i )=> Divider(
      color: appTheme.primaryColor,
    ),
    itemCount: Routes.pageRoutes.length,
    itemBuilder: ( context, i )=> ListTile(
      leading: FaIcon( Routes.pageRoutes[i].icon, color: appTheme.colorScheme.secondary ),
      title: Text( Routes.pageRoutes[i].title ),
      trailing: Icon( Icons.chevron_right, color: appTheme.colorScheme.secondary ),
      onTap: (){
        Navigator.push( context, 
          MaterialPageRoute( builder: (context)=> Routes.pageRoutes[i].page )
        );
      },
    ),
  );
}