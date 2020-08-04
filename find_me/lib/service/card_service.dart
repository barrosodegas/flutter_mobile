import 'package:find_me/model/card_item.dart';
import 'package:flutter/material.dart';

abstract class CardService extends ChangeNotifier {

  void cardItemsHasPairToggled(CardItem cardItem);

  bool cardItemAlreadyContainsPair(String cardItemCode);

  List<CardItem> getAllCardItems();

  bool flipCardsThatHaveNoPair(CardItem cardItem);

}
