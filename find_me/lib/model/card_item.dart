import 'package:flutter/material.dart';

class CardItem {
  String code;
  String title;
  String imageAsset;
  bool faceUp;
  bool wasToggledLast;

  CardItem(this.code, {
    @required this.title,
    @required this.imageAsset,
    this.faceUp = false,
    this.wasToggledLast = false,
  });

  @override
  String toString() {
    return 'CardItem{code: $code, title: $title, imageAsset: $imageAsset, '
        'faceUp: $faceUp, wasToggledLast: $wasToggledLast}';
  }

}
