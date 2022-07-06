import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_demo/routes/routes.dart' show Routes;
import 'package:flutter_demo/routes/application.dart' show Application;
import 'package:flutter_demo/widgets/bottom_navigation_widget.dart';

void main() {
  final router = FluroRouter();
  Application.router = router;
  Routes.configureRoutes(router);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData.light(),
      home: const BottomNavigationWidget(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator, //全局注册
    );
  }
}
