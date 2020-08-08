import 'package:find_me/model/card_item.dart';
import 'package:find_me/service/card_service.dart';
import 'package:flutter/material.dart';

class CardFruitService extends ChangeNotifier implements CardService {

  List<CardItem> cardItems;
  final List<String> pairItems = [];
  int _counter = 0;

  CardFruitService() {
    this.cardItems = _getFruit();
    pairItems.clear();
  }

  @override
  void cardItemsHasPairToggled(CardItem cardItem) {

    if (_counter > 1) --_counter;

    if (_counter > 0) cardItem.wasToggledLast = true;

    if (!pairItems.contains(cardItem.code)) {
      int count = 0;
      for (final CardItem item in cardItems) {
        if (cardItem.code == item.code && cardItem.faceUp && item.faceUp) {
          count++;
        }
      }

      if (count == 2) {
        pairItems.add(cardItem.code);
      }
      _counter++;
    }
    notifyListeners();
  }

  @override
  bool cardItemAlreadyContainsPair(String cardItemCode) {
    return pairItems.contains(cardItemCode);
  }

  @override
  List<CardItem> getAllCardItems() => cardItems;

  @override
  bool flipCardsThatHaveNoPair(CardItem cardItem) {
    bool flip = false;
    if (_counter == 2 && !pairItems.contains(cardItem.code)) {
      flip = true;
    }
    return flip;
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

}
