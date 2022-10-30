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
                backgroundColor: Color(0xFFf7f6f4),
                  appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: Color(0xFF332d2b),
                    automaticallyImplyLeading: true,
                    title: new Text('Detail Type Gunpla'),
                    bottom: TabBar(
                      tabs: [
                        for (var i = 0; i < data.length; i++)
                          Tab(
                            //icon: Icon(Icons.directions_car), //เอากลับมาถ้าอยากใส่
                            text: data[i]["typeHead"],
                          ),
                      ],
                    ),
                  ),
                  body: TabBarView(children: [
                    for (var val in data)
                      ListView(children: [
                        Column(
                          children: [
                            Padding(padding: EdgeInsets.all(15)),
                            InkWell(
                              child: Image.asset(
                                val['image'],
                                height: 300,
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Container(
                                padding: const EdgeInsets.all(0.0),
                                color: Colors.blue,
                                width: 300.0,
                                height: 30.0,
                                child: Text(
                                  val["type"],
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                    fontSize: 25.0,
                                    fontFamily: 'Roboto',
                                    color: new Color(0xFF212121), 
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ), //Container
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Container(
                                padding: const EdgeInsets.all(0.0),
                                //color: Color.fromARGB(48, 167, 203, 232),
                                width: 400.0,
                                height: 40.0,
                                child: Text(
                                  "ขนาด : " + val["size"],
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: 'Roboto',
                                    color: new Color(0xFF212121),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ), //Container
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Container(
                                padding: const EdgeInsets.all(0.0),
                                width: 400.0,
                                child: Text(
                                  "ความหมาย : " + val["detail"],
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                    fontSize: 13.0,
                                    fontFamily: 'Roboto',
                                    color: new Color(0xFF212121),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ), //Container
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Container(
                                padding: const EdgeInsets.all(0.0),
                                width: 400.0,
                                child: Text(
                                  "จำนวนแผงRunner : " + val["runner"],
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: 'Roboto',
                                    color: new Color(0xFF212121),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ), //Container
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Container(
                                padding: const EdgeInsets.all(0.0),
                                //color: Colors.blue,
                                width: 300.0,
                                height: 30.0,
                                child: Text(
                                  "ประเภท Stickers : " + val["Stickers"],
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: 'Roboto',
                                    color: new Color(0xFF212121),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ), //Container
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                          ],
                        )
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
