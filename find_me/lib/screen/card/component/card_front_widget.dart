import 'package:flutter/material.dart';

class CardFrontWidget extends StatelessWidget {

  final Function() onTap;
  final Color color;
  final double cardWidth;
  final double cardHeight;

  CardFrontWidget({
    Key key,
    this.color,
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
          alignment: Alignment.center,
          height: cardHeight,
          width: cardWidth,
          color: color,
          child: Text(
            '?',
            style: TextStyle(
              color: Colors.white,
              fontSize: cardWidth / 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
