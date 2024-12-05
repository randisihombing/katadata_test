import 'package:flutter/material.dart';

import 'helper/pages.dart';
import 'helper/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deptech Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Pages.splash,
      onGenerateRoute: MyRouter().generateRoute,
    );
  }
}