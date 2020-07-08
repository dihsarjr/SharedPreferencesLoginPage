import 'package:flutter/material.dart';

class HomePageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Container(
        child: Text(
          'Welcome',
          style: TextStyle(fontSize: 40),
        ),
      ),
    )));
  }
}
