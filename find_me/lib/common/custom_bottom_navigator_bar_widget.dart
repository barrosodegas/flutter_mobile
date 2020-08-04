import 'package:find_me/service/page_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigatorBarWidget extends StatefulWidget {

  final int selectedItem;

  const CustomBottomNavigatorBarWidget({Key key, @required this.selectedItem}) : super(key: key);

  @override
  _CustomBottomNavigatorBarWidgetState createState() => _CustomBottomNavigatorBarWidgetState();
}

class _CustomBottomNavigatorBarWidgetState extends State<CustomBottomNavigatorBarWidget> {

  int get selectedItem => widget.selectedItem;

  @override
  Widget build(BuildContext context) {

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
      currentIndex: selectedItem,
      selectedItemColor: Colors.amber[800],
      onTap: (index) async {
        if (selectedItem != index) {
          context.read<PageService>().setPage(index);
          setState(() {});
        }
      },
    );
  }
}
