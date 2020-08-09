import 'package:find_me/model/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardBackWidget extends StatelessWidget {

  final Color color;
  final CardItem cardItem;
  final Function() onTap;
  final double cardWidth;
  final double cardHeight;

  CardBackWidget({
    Key key,
    this.color,
    this.cardItem,
    @required this.cardWidth,
    @required this.cardHeight,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          height: cardHeight,
          width: cardWidth,
          color: color,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: cardHeight > 100 ? 8 : 1),
                alignment: Alignment.topCenter,
                child: Image.asset(
                  cardItem.imageAsset,
                  height: cardHeight * 0.58,
                  width: cardWidth * 0.58,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  cardItem.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: cardWidth / 6,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
