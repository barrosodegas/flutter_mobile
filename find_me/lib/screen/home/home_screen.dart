import 'package:find_me/model/card_item.dart';
import 'package:find_me/screen/card/card_screen.dart';
import 'package:find_me/service/card_animals_service.dart';
import 'package:find_me/service/card_fruit_service.dart';
import 'package:find_me/service/card_vegetables_service.dart';
import 'package:find_me/service/page_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider(
          create: (_) => PageService(_pageController),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => CardFruitService(_getFruit()),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => CardAnimalsService(_getAnimals()),
        ),
        ChangeNotifierProvider(
          create: (_) => CardVegetablesService(_getVegetables()),
        ),
      ],
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: <Widget>[
          CardScreen(
            color: Colors.blue,
            selectedItem: 0,
            cardType: CardType.FRUIT,
          ),
          CardScreen(
            color: Colors.blue,
            selectedItem: 1,
            cardType: CardType.ANIMALS,
          ),
          CardScreen(
            color: Colors.blue,
            selectedItem: 2,
            cardType: CardType.VEGETABLES,
          ),
        ],
      ),
    );
  }

  List<CardItem> _getFruit() => [
    CardItem(
        'apple',
        title: 'Maçã',
        imageAsset: 'images/fruit/apple.png'
    ),
    CardItem(
        'banana',
        title: 'Banana',
        imageAsset: 'images/fruit/banana.png'
    ),
    CardItem(
        'grape',
        title: 'Uva',
        imageAsset: 'images/fruit/grape.png'
    ),
    CardItem(
        'orange',
        title: 'Laranja',
        imageAsset: 'images/fruit/orange.png'
    ),
    CardItem(
        'pineapple',
        title: 'Abacaxi',
        imageAsset: 'images/fruit/pineapple.png'
    ),
    CardItem(
        'watermelon',
        title: 'Melancia',
        imageAsset: 'images/fruit/watermelon.png'
    ),
    CardItem(
        'apple',
        title: 'Maçã',
        imageAsset: 'images/fruit/apple.png'
    ),
    CardItem(
        'banana',
        title: 'Banana',
        imageAsset: 'images/fruit/banana.png'
    ),
    CardItem(
        'grape',
        title: 'Uva',
        imageAsset: 'images/fruit/grape.png'
    ),
    CardItem(
        'orange',
        title: 'Laranja',
        imageAsset: 'images/fruit/orange.png'
    ),
    CardItem(
        'pineapple',
        title: 'Abacaxi',
        imageAsset: 'images/fruit/pineapple.png'
    ),
    CardItem(
        'watermelon',
        title: 'Melancia',
        imageAsset: 'images/fruit/watermelon.png'
    ),
  ];

  List<CardItem> _getAnimals() => [
    CardItem(
        'butterfly',
        title: 'Borboleta',
        imageAsset: 'images/animals/butterfly.png'
    ),
    CardItem(
        'cat',
        title: 'Gato',
        imageAsset: 'images/animals/cat.png'
    ),
    CardItem(
        'dog',
        title: 'Cachorro',
        imageAsset: 'images/animals/dog.png'
    ),
    CardItem(
        'monkey',
        title: 'Macaco',
        imageAsset: 'images/animals/monkey.png'
    ),
    CardItem(
        'parrot',
        title: 'Papagaio',
        imageAsset: 'images/animals/parrot.png'
    ),
    CardItem(
        'whale',
        title: 'Baleia',
        imageAsset: 'images/animals/whale.png'
    ),
    CardItem(
        'butterfly',
        title: 'Borboleta',
        imageAsset: 'images/animals/butterfly.png'
    ),
    CardItem(
        'cat',
        title: 'Gato',
        imageAsset: 'images/animals/cat.png'
    ),
    CardItem(
        'dog',
        title: 'Cachorro',
        imageAsset: 'images/animals/dog.png'
    ),
    CardItem(
        'monkey',
        title: 'Macaco',
        imageAsset: 'images/animals/monkey.png'
    ),
    CardItem(
        'parrot',
        title: 'Papagaio',
        imageAsset: 'images/animals/parrot.png'
    ),
    CardItem(
        'whale',
        title: 'Baleia',
        imageAsset: 'images/animals/whale.png'
    ),
  ];

  List<CardItem> _getVegetables() => [
    CardItem(
      'carrot',
      title: 'Cenoura',
      imageAsset: 'images/vegetables/carrot.png'
    ),
    CardItem(
        'beet',
        title: 'Beterraba',
        imageAsset: 'images/vegetables/beet.png'
    ),
    CardItem(
        'broccoli',
        title: 'Brócolis',
        imageAsset: 'images/vegetables/broccoli.png'
    ),
    CardItem(
        'lettuce',
        title: 'Alface',
        imageAsset: 'images/vegetables/lettuce.png'
    ),
    CardItem(
        'pod',
        title: 'Vagem',
        imageAsset: 'images/vegetables/pod.png'
    ),
    CardItem(
        'pumpkin',
        title: 'Abóbora',
        imageAsset: 'images/vegetables/pumpkin.png'
    ),
    CardItem(
        'carrot',
        title: 'Cenoura',
        imageAsset: 'images/vegetables/carrot.png'
    ),
    CardItem(
        'beet',
        title: 'Beterraba',
        imageAsset: 'images/vegetables/beet.png'
    ),
    CardItem(
        'broccoli',
        title: 'Brócolis',
        imageAsset: 'images/vegetables/broccoli.png'
    ),
    CardItem(
        'lettuce',
        title: 'Alface',
        imageAsset: 'images/vegetables/lettuce.png'
    ),
    CardItem(
        'pod',
        title: 'Vagem',
        imageAsset: 'images/vegetables/pod.png'
    ),
    CardItem(
        'pumpkin',
        title: 'Abóbora',
        imageAsset: 'images/vegetables/pumpkin.png'
    ),
  ];

}
