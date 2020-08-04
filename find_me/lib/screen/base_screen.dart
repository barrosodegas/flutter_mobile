import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseScreen extends StatefulWidget {

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Encontre os pares!!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 60,
          width: 240,
          child: RaisedButton(
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () => Navigator.of(context).pushNamed('/home'),
            child: const Text(
              'Jogar!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
