import 'package:find_me/model/card_item.dart';
import 'package:find_me/service/card_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardVegetablesService extends ChangeNotifier implements CardService {

  final List<String> pairItems = [];
  final SharedPreferences storage;

  List<CardItem> cardItems;
  int _counter = 0;

  CardVegetablesService(this.storage) {
    this.cardItems = _getVegetables();
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
        storage.setInt('score_vegetables', (storage.getInt("score_vegetables") ?? 0) + 1);
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
