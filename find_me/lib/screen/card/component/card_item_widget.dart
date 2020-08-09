import 'package:find_me/model/card_item.dart';
import 'package:find_me/screen/card/component/card_back_widget.dart';
import 'package:find_me/screen/card/component/card_front_widget.dart';
import 'package:find_me/service/card_service.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class CardItemWidget extends StatefulWidget {

  final Color color;
  final CardItem cardItem;
  final CardService cardService;
  final double cardWidth;
  final double cardHeight;

  CardItemWidget({
    Key key,
    this.color,
    this.cardItem,
    @required this.cardService,
    @required this.cardWidth,
    @required this.cardHeight,
  }) : super(key: key);

  @override
  _CardItemWidgetState createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {

  final GlobalKey<FlipCardState> _flipCardItemKey = GlobalKey<FlipCardState>();
  bool togged = false;

  CardService get service => widget.cardService;

  CardItem get item => widget.cardItem;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    await Future.delayed(Duration(seconds: 1));
    _flipCardItemKey.currentState?.toggleCard();
    await Future.delayed(Duration(seconds: 2));
    _flipCardItemKey.currentState?.toggleCard();
  }

  @override
  Widget build(BuildContext context) {

    if (service.flipCardsThatHaveNoPair(item)) {
      if (item.faceUp && !item.wasToggledLast) {
        _flipCardItemKey.currentState.toggleCard();
        item.faceUp = false;
      }
      item.wasToggledLast = false;
    }

    return FlipCard(
      key: _flipCardItemKey,
      flipOnTouch: false,
      direction: FlipDirection.HORIZONTAL,
      speed: 800,
      front: CardFrontWidget(
        color: widget.color,
        cardWidth: widget.cardWidth,
        cardHeight: widget.cardHeight,
        onTap: () {
          _flipCardItemKey.currentState.toggleCard();
          if (item.faceUp) {
            item.faceUp = false;
          } else {
            item.faceUp = true;
          }
          service.cardItemsHasPairToggled(item);
        },
      ),
      back: CardBackWidget(
        color: widget.color,
        cardItem: widget.cardItem,
        cardWidth: widget.cardWidth,
        cardHeight: widget.cardHeight,
        onTap: () {
          if (!service.cardItemAlreadyContainsPair(item.code)) {
            if (item.faceUp) {
              item.faceUp = false;
            } else {
              item.faceUp = true;
            }
            _flipCardItemKey.currentState.toggleCard();
          }
        },
      ),
    );
  }
}
