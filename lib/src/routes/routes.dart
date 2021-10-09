import 'package:flutter/widgets.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:circular_progress/src/pages/emerge_page.dart';
import 'package:circular_progress/src/pages/graficas_circulares_page.dart';
import 'package:circular_progress/src/pages/pinterest_page.dart';
import 'package:circular_progress/src/pages/sliceshow_page.dart';
import 'package:circular_progress/src/pages/sliver_list_page.dart';

final pageRoutes = <_Route>[
  _Route( FontAwesomeIcons.slideshare, 'Slide show', SlideShowPage() ),
  _Route( FontAwesomeIcons.ambulance, 'Emergenci page', EmergencyPage()),
  _Route( FontAwesomeIcons.circleNotch, 'Cricular progress', GraficasCirculares()),
  _Route( FontAwesomeIcons.pinterest, 'Pinterest', PinterstPage()),
  _Route( FontAwesomeIcons.mobile, 'Slivers', SliverListPage()),
];

class _Route {
  _Route(this.icon, this.title, this.page);

  final IconData icon;
  final String title;
  final Widget page;
}