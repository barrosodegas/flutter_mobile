import 'package:find_me/model/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardBackWidget extends StatelessWidget {

  Color color;
  CardItem cardItem;
  final Function() onTap;

  CardBackWidget({
    Key key,
    this.color,
    this.cardItem,
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
          height: 110,
          width: 80,
          color: color,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 8),
                alignment: Alignment.topCenter,
                child: Image.asset(cardItem.imageAsset, height: 70, width: 70,),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  cardItem.title,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
