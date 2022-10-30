// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:appgunplalistshop/Bar/profile/widget/repeated_list.dart';
import 'package:flutter/material.dart';
import 'package:appgunplalistshop/animation/fadeanimation.dart';
import 'package:appgunplalistshop/constanst.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({Key? key}) : super(key: key);

  @override
  _BodyProfileState createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  int statusCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.fromLTRB(5, 80, 5, 5),
      margin: EdgeInsets.all(15),
      width: width,
      height: height,
      // color: Colors.red.withOpacity(0.4),
      child: Column(
        children: [
          topProfilePicAndName(width, height),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 30,
          ),
          middleDashbord(width, height),
          bottomSection(width, height),
        ],
      ),
    );
  }

  // Top Profile Photo And Name Components
  topProfilePicAndName(width, height) {
    return FadeAnimation(
      delay: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/exaw.jpg"),
            ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My is Gundam",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
              Text(
                "Normal",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit_outlined,
                color: Colors.grey,
              ))
        ],
      ),
    );
  }

  // Middle Dashbord Listtile Components
  middleDashbord(width, height) {
    return FadeAnimation(
      delay: 2,
      child: Container(
        width: width,
        height: (height / 3) - 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dashboard",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            RoundedLisTile(
              width: width,
              height: height,
              leadingBackColor: Colors.green[600],
              icon: Icons.wallet,
              title: "My Wallet 1000฿",
              trailing: Container(
                width: 80,
                height: 30,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: lightTextColor,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
  
  // My Account Section Components
  bottomSection(width, height) {
    return FadeAnimation(
      delay: 2.5,
      child: Container(
        padding: EdgeInsets.only(top: 100),
        width: width,
        height: height / 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "    My Account",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "    Switch to Other Account",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[600],
                  fontSize: 17),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "    Log Out",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.red[500],
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
