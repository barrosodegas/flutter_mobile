import 'package:find_me/screen/base_screen.dart';
import 'package:find_me/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (settings) {
        switch(settings.name) {
          case '/home':
            return MaterialPageRoute(
              builder: (_) => HomeScreen(),
              settings: settings,
            );
          default:
            return MaterialPageRoute(
              builder: (_) => BaseScreen(),
              settings: settings,
            );
        }
      },
    ),
  );
}
