import 'package:appgunplalistshop/Screen/Home/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';

class ShopScreenGundam extends StatefulWidget {
  const ShopScreenGundam({super.key});

  @override
  State<ShopScreenGundam> createState() => _ShopScreenGundamState();
}

class _ShopScreenGundamState extends State<ShopScreenGundam> {
  late TabController _tabController;

  Future<dynamic> readJson() async {
    final jsonData = await rootBundle.loadString("assets/details.json");
    var data = await json.decode(jsonData);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 10,
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
                        for (var i = 0; i < 9; i++)
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
                              child: Text(val["name"]),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Welcome()),
                                );
                              }),
                              Padding(padding: EdgeInsets.all(10)),
                              InkWell(
                              child: Text(val["price"]),
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


















//     return Scaffold(
//         body: Center(
//           child: FutureBuilder(
//             future: DefaultAssetBundle.of(context)
//                 .loadString('assets/details.json'),
//             builder: (context, snapshot) {
//               // Decode the JSON
//               var newData = json.decode(snapshot.data.toString());

//       return MaterialApp(
//       home: DefaultTabController(
//         length: 3,
//         child: FutureBuilder(
//           future: readJson(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               var data = snapshot.data;

//               return ListView.builder(
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                           top: 32, bottom: 32, left: 16, right: 16),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               InkWell(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (_) => Welcome()));
//                                 },
//                                 child: Text(
//                                   newData[index]['type'],
//                                   //'Note Title',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 22),
//                                 ),
//                               ),
//                               Text(
//                                 newData[index]['name'],
//                                 //'Note Text',
//                                 style: TextStyle(color: Colors.grey.shade600),
//                               ),
//                             ],
//                           ),
//                           //SizedBox(width: 20),
//                           Container(
//                             height: 50,
//                             width: 50,
//                             child: Image.asset(newData[index]['image']),
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//                 itemCount: newData == null ? 0 : newData.length,
//               );
//             },
//           ),
//         ),
//       );
        
//   }
// }
