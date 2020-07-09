import 'package:flutter/material.dart';
import 'package:login_page/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageOne extends StatelessWidget {
  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.remove("email");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome',
              style: TextStyle(fontSize: 40),
            ),
            RaisedButton(
                child: Text('Logout'),
                onPressed: () {
                  removeValues();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                })
          ],
        ),
      ),
    )));
  }
}
