import 'dart:math';

import 'package:find_me/model/card_item.dart';
import 'package:find_me/screen/card/component/card_item_widget.dart';
import 'package:find_me/service/card_animals_service.dart';
import 'package:find_me/service/card_fruit_service.dart';
import 'package:find_me/service/card_service.dart';
import 'package:find_me/service/card_vegetables_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum CardType { FRUIT, ANIMALS, VEGETABLES }

class CardScreen extends StatelessWidget {

  final List<int> indexes = [];
  final CardType cardType;
  final Color color;
  final SharedPreferences storage;

  CardScreen({Key key, this.cardType, this.color, this.storage}) : super(key: key) {
    _randomIndexes();
  }

  CardService _getCardServiceByType(BuildContext context) {

    CardService cardService;
    switch(cardType) {
      case CardType.FRUIT:
        cardService = context.watch<CardFruitService>();
        break;
      case CardType.ANIMALS:
        cardService = context.watch<CardAnimalsService>();
        break;
      default:
        cardService = context.watch<CardVegetablesService>();
    }
    return cardService;
  }

  void _randomIndexes() {
    indexes.clear();
    final Random r = Random();
    while (indexes.length < 12) {
      int i = r.nextInt(12);
      if (!indexes.contains(i)) {
        indexes.add(i);
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    final CardService cardService = _getCardServiceByType(context);
    final List<CardItem> cardItems = cardService.getAllCardItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Encontre meu par!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer3<CardFruitService, CardAnimalsService, CardVegetablesService>(
        builder: (_, __, ___, ____, _____) {

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    for (int i = 0; i < 3; i++)
                      CardItemWidget(
                        color: color,
                        cardItem: cardItems[indexes[i]],
                        cardService: cardService,
                      ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    for (int i = 3; i < 6; i++)
                      CardItemWidget(
                        color: color,
                        cardItem: cardItems[indexes[i]],
                        cardService: cardService,
                      ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    for (int i = 6; i < 9; i++)
                      CardItemWidget(
                        color: color,
                        cardItem: cardItems[indexes[i]],
                        cardService: cardService,
                      ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    for (int i = 9; i < 12; i++)
                      CardItemWidget(
                        color: color,
                        cardItem: cardItems[indexes[i]],
                        cardService: cardService,
                      ),
                  ],
                ),
                if (cardService is CardFruitService)
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        'Pontos Frutas: ${(storage.getInt("score_fruit") ?? 0)}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  )
                else if (cardService is CardAnimalsService)
                  Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          'Pontos Animais: ${(storage.getInt("score_animals") ?? 0)}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                  )
                else
                  Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          'Pontos Vegetais: ${(storage.getInt("score_vegetables") ?? 0)}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
