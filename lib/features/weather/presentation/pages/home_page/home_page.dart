// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  /// IN this page we will show to user name of choosen city and
  /// the temprature for that city
  /// its enough for now
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          SizedBox(height: 50),
          Text('place holder for city name, e.x tehran'),
          Text('temp : 25 C'),

        ],
      ),
    );
  }
}
