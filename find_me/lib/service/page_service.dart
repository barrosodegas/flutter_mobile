import 'package:flutter/cupertino.dart';

class PageService {

  final PageController _pageController;
  int page = 0;

  PageService(this._pageController);

  void setPage(int value) {
    if (page == value) return;

    try {
      page = value;
      _pageController.jumpToPage(value);
    // ignore: empty_catches
    } catch(error) {}
  }

}