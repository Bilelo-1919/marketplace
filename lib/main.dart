import 'package:flutter/material.dart';
import 'package:market_place/View/marketplace.dart';
import 'package:market_place/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MaterialApp(
        title: 'Marketplace',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Marketplace'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Card'),
                Tab(text: 'Pack'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Add your Home screen widget here
              Marketplace(),
              Center(child: Text('Home Screen')),

              // Add your Categories screen widget here
              Center(child: Text('Categories Screen')),

              // Add your Profile screen widget here
              Center(child: Text('Profile Screen')),
            ],
          ),
        ),
      ),
    );
  }
}
