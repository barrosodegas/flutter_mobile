import 'dart:math';

import 'package:find_me/common/custom_bottom_navigator_bar_widget.dart';
import 'package:find_me/model/card_item.dart';
import 'package:find_me/screen/card/component/card_item_widget.dart';
import 'package:find_me/service/card_animals_service.dart';
import 'package:find_me/service/card_fruit_service.dart';
import 'package:find_me/service/card_service.dart';
import 'package:find_me/service/card_vegetables_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum CardType { FRUIT, ANIMALS, VEGETABLES }

class CardScreen extends StatefulWidget {

  final Color color;
  final int selectedItem;
  final CardType cardType;

  CardScreen({
    Key key,
    this.color,
    this.selectedItem,
    this.cardType,
  }) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {

  final List<int> indexes = [];

  CardService _getCardServiceByType(BuildContext context) {

    CardService cardService;
    switch(widget.cardType) {
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
  void initState() {
    super.initState();
    _randomIndexes();
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
      bottomNavigationBar: CustomBottomNavigatorBarWidget(selectedItem: widget.selectedItem,),
      body: Consumer3<CardFruitService, CardAnimalsService, CardVegetablesService>(
        builder: (_, __, ___, ____, _____) {

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CardItemWidget(
                      color: widget.color,
                      cardItem: cardItems[indexes[0]],
                      cardService: cardService,
                    ),
                    CardItemWidget(
                      color: widget.color,
                      cardItem: cardItems[indexes[1]],
                      cardService: cardService,
                    ),
                    CardItemWidget(
                      color: widget.color,
                      cardItem: cardItems[indexes[2]],
                      cardService: cardService,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CardItemWidget(
                      color: widget.color,
                      cardItem: cardItems[indexes[3]],
                      cardService: cardService,
                    ),
                    CardItemWidget(
                      color: widget.color,
                      cardItem: cardItems[indexes[4]],
                      cardService: cardService,
                    ),
                    CardItemWidget(
                      color: widget.color,
                      cardItem: cardItems[indexes[5]],
                      cardService: cardService,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CardItemWidget(
                      color: widget.color,
                      cardItem: cardItems[indexes[6]],
                      cardService: cardService,
                    ),
                    CardItemWidget(
                      color: widget.color,
                      cardItem: cardItems[indexes[7]],
                      cardService: cardService,
                    ),
                    CardItemWidget(
                      color: widget.color,
                      cardItem: cardItems[indexes[8]],
                      cardService: cardService,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CardItemWidget(
                      color: widget.color,
                      cardItem: cardItems[indexes[9]],
                      cardService: cardService,
                    ),
                    CardItemWidget(
                      color: widget.color,
                      cardItem: cardItems[indexes[10]],
                      cardService: cardService,
                    ),
                    CardItemWidget(
                      color: widget.color,
                      cardItem: cardItems[indexes[11]],
                      cardService: cardService,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
