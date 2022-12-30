import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sale_products/app_ui/screens_route.dart';
import 'package:sale_products/cards/card0.dart';
import 'package:sale_products/dummy_page.dart';
// 1
class Home extends StatefulWidget {
  const Home({super.key});
  
  @override
  HomeState createState() => HomeState();
  }
  
  class HomeState extends State<Home> {
    // ignore: todo
    // TODO: Add state variables and functions
     int _selectedIndex = 0;

     static List<Widget> pages = <Widget>[
      // ignore: todo
      //TODO: Replace with Home
      const Card0(),
      //Container(color: Colors.blueGrey,),
      // ignore: todo
      //TODO: Replace with Card2
      const ScreensRoute(),
      //const ActivitiesScreen(),
      //Container(color: Colors.transparent,),
      // ignore: todo
      //TODO: Replace with Card3
      const DummyPage(), 
      //Container(color: Colors.teal,),
      // ignore: todo
      //TODO: Replace with Card4
      Container(color: Colors.deepPurple,),
     ];

     /*void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
     }*/

    @override
    Widget build(BuildContext context) {
      final items = <Widget> [
        const Icon(Icons.home, size: 30,),
        //const Icon(Icons.search, size: 30),
        const Icon(Icons.shopping_basket, size: 30),
        const Icon(Icons.payment, size: 30),
        //const Icon(Icons.person, size: 30),
        const Icon(Icons.check_box, size: 30,)
      ];
      return Scaffold(
        extendBody: true,
        /*appBar: AppBar(
          title: Text(
            'App',
            // 2
            style: Theme.of(context).textTheme.headline6,
          ),
          centerTitle: true,
        ),*/

        // ignore: todo
        // TODO: Show selected tab
        body: pages[_selectedIndex],
        // ignore: todo
        // TODO: Add bottom navigation bar
        // 4
        bottomNavigationBar: CurvedNavigationBar(
          // 5
          color: Colors.blueGrey,
          backgroundColor: Colors.transparent,
          height: 60,
          index: _selectedIndex,
          items: items,
          onTap: (index) => setState(() {
            _selectedIndex = index;
          }),
        ),
      );
    }
  }