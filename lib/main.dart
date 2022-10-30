import 'dart:convert';

import 'package:appgunplalistshop/Bar/Home/bottomNavigationBar.dart';
import 'package:appgunplalistshop/Bar/naviBar.dart';
import 'package:appgunplalistshop/Screen/Home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:appgunplalistshop/Screen/Home/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyStatefulWidget(),
    );
  }
}

