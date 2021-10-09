import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:circular_progress/src/theme/theme.dart';
import 'package:circular_progress/src/widgets/slideshow.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeProvider>(context).currentTheme;

    return Scaffold(
      body: Center(child: Slideshow(slides: [
        SvgPicture.asset('assets/svgs/1.svg'),
        SvgPicture.asset('assets/svgs/2.svg'),
        SvgPicture.asset('assets/svgs/3.svg'),
        SvgPicture.asset('assets/svgs/4.svg'),
        SvgPicture.asset('assets/svgs/5.svg'),
        SvgPicture.asset('assets/svgs/2.svg'),
      ],
      color: appTheme.colorScheme.secondary,
      tamPri: 20,
      tamSec: 12,
      ),),
    );
  }
}
