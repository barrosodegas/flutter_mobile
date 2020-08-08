import 'package:find_me/model/card_item.dart';
import 'package:find_me/screen/base_screen.dart';
import 'package:find_me/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:find_me/service/card_animals_service.dart';
import 'package:find_me/service/card_fruit_service.dart';
import 'package:find_me/service/card_vegetables_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CardFruitService(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => CardAnimalsService(),
        ),
        ChangeNotifierProvider(
          create: (_) => CardVegetablesService(),
        ),
      ],
      child: MaterialApp(
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
    ),
  );
}
