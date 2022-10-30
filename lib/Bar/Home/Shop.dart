import 'package:appgunplalistshop/Screen/Home/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';

class DetailGundam extends StatefulWidget {
  const DetailGundam({super.key});

  @override
  State<DetailGundam> createState() => _DetailGundamState();
}

class _DetailGundamState extends State<DetailGundam> {
  late TabController _tabController;

  Future<dynamic> readJson() async {
    final jsonData = await rootBundle.loadString("assets/detailG.json");
    var data = await json.decode(jsonData);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 6,
        child: FutureBuilder(
          future: readJson(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: true,
                    title: new Text('Shopping'),
                    bottom: TabBar(
                      tabs: [
                        for (var i = 0; i < data.length; i++)
                          Tab(
                            //icon: Icon(Icons.directions_car), //เอากลับมาถ้าอยากใส่
                            text: data[i]["id"],
                          ),
                      ],
                    ),
                  ),
                  body: TabBarView(children: [
                    for (var val in data)
                      Column(
                        children: [
                          Padding(padding: EdgeInsets.all(30)),
                          InkWell(
                              child: Image.asset(
                                val['image'],
                                height: 300,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Welcome()),
                                );
                              }),
                              Padding(padding: EdgeInsets.all(10)),
                              InkWell(
                              child: Text(val["type"]),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Welcome()),
                                );
                              }),
                        ])
                  ]));
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

