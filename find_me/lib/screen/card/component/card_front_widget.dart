import 'package:flutter/material.dart';

class CardFrontWidget extends StatelessWidget {

  final Function() onTap;
  Color color;

  CardFrontWidget({Key key, this.color, this.onTap}) : super(key: key);

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
          height: 110,
          width: 80,
          color: color,
          child: const Text(
            '?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 56,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
