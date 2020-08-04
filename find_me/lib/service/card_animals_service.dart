import 'package:find_me/model/card_item.dart';
import 'package:find_me/service/card_service.dart';
import 'package:flutter/material.dart';

class CardAnimalsService extends ChangeNotifier implements CardService {

  List<CardItem> cardItems;
  final List<String> pairItems = [];
  int _counter = 0;

  CardAnimalsService(List<CardItem> cardItems) {
    this.cardItems = cardItems;
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

}
