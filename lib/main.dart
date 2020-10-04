import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportsdb/components/countries.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Sports DB',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The Sports DB',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        elevation: 0,
      ),
      body: CountryList(),
    );
  }
}
