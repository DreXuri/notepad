import 'package:flutter/material.dart';
import 'package:noteapp/sections/add_notes/add_notes.dart';
import 'package:noteapp/sections/homepage/homepage.dart';
import 'package:page_transition/page_transition.dart';

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Homepage.route:
      return PageTransition(
        child: const Homepage(),
        type: PageTransitionType.rightToLeft,
      );

    case AddNotes.route:
      return PageTransition(
        child: const AddNotes(),
        type: PageTransitionType.rightToLeft,
      );

    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
