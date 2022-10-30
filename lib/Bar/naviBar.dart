import 'package:appgunplalistshop/Bar/Home/cartbag.dart.dart';
import 'package:appgunplalistshop/Bar/Home/detailGradeGundamPage.dart';
import 'package:appgunplalistshop/Bar/Home/shopPage.dart';
import 'package:appgunplalistshop/Bar/profile/widget/body.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    DetailGundam(),
    ShopScreenGundam(),
    CartBag(),
    BodyProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xFFfcab88),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_sharp),
            label: 'Business',
            backgroundColor: Color(0xFFffd28d),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'School',
            backgroundColor: Color(0xFF89dad0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp),
            label: 'Settings',
            backgroundColor: Color(0xFF89d7da),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF332d2b),
        onTap: _onItemTapped,
      ),
    );
  }
}
