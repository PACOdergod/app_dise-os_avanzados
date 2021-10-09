import 'package:circular_progress/src/pages/launcher_page.dart';
import 'package:circular_progress/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (_)=> new ThemeProvider(),
    child: MyApp()
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context).currentTheme;

    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: LauncherPage()
    );
  }
}
