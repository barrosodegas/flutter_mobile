import 'package:find_me/model/card_item.dart';
import 'package:find_me/service/card_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardAnimalsService extends ChangeNotifier implements CardService {

  final List<String> pairItems = [];
  final SharedPreferences storage;

  List<CardItem> cardItems;
  int _counter = 0;

  CardAnimalsService(this.storage) {
    this.cardItems = _getAnimals();
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
        storage.setInt('score_animals', (storage.getInt("score_animals") ?? 0) + 1);
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

  List<CardItem> _getAnimals() => [
    CardItem(
        'butterfly',
        title: 'Borboleta',
        imageAsset: 'assets/images/animals/butterfly.png'
    ),
    CardItem(
        'cat',
        title: 'Gato',
        imageAsset: 'assets/images/animals/cat.png'
    ),
    CardItem(
        'dog',
        title: 'Cachorro',
        imageAsset: 'assets/images/animals/dog.png'
    ),
    CardItem(
        'monkey',
        title: 'Macaco',
        imageAsset: 'assets/images/animals/monkey.png'
    ),
    CardItem(
        'parrot',
        title: 'Papagaio',
        imageAsset: 'assets/images/animals/parrot.png'
    ),
    CardItem(
        'whale',
        title: 'Baleia',
        imageAsset: 'assets/images/animals/whale.png'
    ),
    CardItem(
        'butterfly',
        title: 'Borboleta',
        imageAsset: 'assets/images/animals/butterfly.png'
    ),
    CardItem(
        'cat',
        title: 'Gato',
        imageAsset: 'assets/images/animals/cat.png'
    ),
    CardItem(
        'dog',
        title: 'Cachorro',
        imageAsset: 'assets/images/animals/dog.png'
    ),
    CardItem(
        'monkey',
        title: 'Macaco',
        imageAsset: 'assets/images/animals/monkey.png'
    ),
    CardItem(
        'parrot',
        title: 'Papagaio',
        imageAsset: 'assets/images/animals/parrot.png'
    ),
    CardItem(
        'whale',
        title: 'Baleia',
        imageAsset: 'assets/images/animals/whale.png'
    ),
  ];

}
