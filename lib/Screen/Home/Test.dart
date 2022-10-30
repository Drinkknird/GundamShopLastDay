import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Future<dynamic> readJson() async {
    final jsonData = await rootBundle.loadString("assets/items.json");
    var data = await json.decode(jsonData);
    return data;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: FutureBuilder(
          future: readJson(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    tabs: [
                      for (var val in data)
                        Tab(
                          // icon: Icon(Icons.directions_car), //เอากลับมาถ้าอยากใส่
                          text: val["name"],
                        ),
                    ],
                  ),
                  title: const Text('Tabs Demo'),
                ),
                body: TabBarView(
                  children: [
                    for (var val in data)
                      Center(
                        child: Text(val["color"]),
                      ),
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
