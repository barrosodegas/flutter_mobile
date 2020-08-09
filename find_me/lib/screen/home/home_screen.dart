import 'package:find_me/screen/card/card_screen.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {

  final SharedPreferences storage;

  const HomeScreen({Key key, this.storage}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  MotionTabController _motionTabController;

  SharedPreferences get storage => widget.storage;

  @override
  void initState() {
    super.initState();
    _motionTabController = new MotionTabController(initialIndex: 0, vsync: this);
  }

  @override
  void dispose() {
    _motionTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: MotionTabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _motionTabController,
        children: <Widget>[
          CardScreen(
            color: Colors.blue,
            cardType: CardType.FRUIT,
            storage: storage,
          ),
          CardScreen(
            color: Colors.blue,
            cardType: CardType.ANIMALS,
            storage: storage,
          ),
          CardScreen(
            color: Colors.blue,
            cardType: CardType.VEGETABLES,
            storage: storage,
          ),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        labels: [
          'Frutas', 'Animais', 'Vegetais',
        ],
        initialSelectedTab: 'Frutas',
        tabIconColor: Colors.green,
        tabSelectedColor: Colors.blue,
        icons: [
          IconData(0xe900, fontFamily: 'fruit_apple'),
          Icons.pets,
          Icons.spa,
        ],
        textStyle: TextStyle(
          color: Colors.red,
        ),
        onTabItemSelected: (index) {
          if (_motionTabController.index != index) {
            setState(() {
              _motionTabController.index = index;
            });
          }
        },
      ),
    );
  }

}
