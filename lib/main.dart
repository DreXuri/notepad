import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noteapp/config/routes.dart';
import 'package:noteapp/sections/homepage/homepage.dart';
import 'package:noteapp/widgets/my_scroll_behaviour.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //  final textTheme = Theme.of(context).textTheme;
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: (context, widget) {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          widget = ScrollConfiguration(
            behavior: const MyScrollBehavior(),
            child: widget!,
          );
          return widget;
        },
        onGenerateRoute: (settings) => generateRoute(settings),
        initialRoute: Homepage.route,
      );
    });
  }
}
