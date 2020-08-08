import 'package:find_me/screen/base_screen.dart';
import 'package:find_me/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:find_me/service/card_animals_service.dart';
import 'package:find_me/service/card_fruit_service.dart';
import 'package:find_me/service/card_vegetables_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences storage = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CardFruitService(storage),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => CardAnimalsService(storage),
        ),
        ChangeNotifierProvider(
          create: (_) => CardVegetablesService(storage),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Encontre-me',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: (settings) {
          switch(settings.name) {
            case '/home':
              return MaterialPageRoute(
                builder: (_) => HomeScreen(storage: storage,),
                settings: settings,
              );
            default:
              return MaterialPageRoute(
                builder: (_) => BaseScreen(storage: storage),
                settings: settings,
              );
          }
        },
      ),
    ),
  );
}
