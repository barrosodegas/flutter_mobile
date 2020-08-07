import 'package:find_me/screen/card/card_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          CardScreen(
            color: Colors.blue,
            cardType: CardType.FRUIT,
          ),
          CardScreen(
            color: Colors.blue,
            cardType: CardType.ANIMALS,
          ),
          CardScreen(
            color: Colors.blue,
            cardType: CardType.VEGETABLES,
          ),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: pageController,
        builder: (_, __) {

          return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('images/fruit/grape.png')),
                title: Text('Frutas'),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('images/animals/cat.png')),
                title: Text('Animais'),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('images/vegetables/carrot.png')),
                title: Text('Vegetais'),
              ),
            ],
            currentIndex: pageController?.page?.round() ?? 0,
            selectedItemColor: Colors.amber[800],
            onTap: (index) async {
              if ((pageController?.page?.round() ?? 0) != index) {
                setState(() {
                  pageController.jumpToPage(index);
                });
              }
            },
          );
        },
      ),
    );
  }

}
