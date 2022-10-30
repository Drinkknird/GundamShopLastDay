import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:appgunplalistshop/widgets/big_text.dart';
import 'package:appgunplalistshop/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:appgunplalistshop/utils/colors.dart';

class CartBag extends StatefulWidget {
  const CartBag({super.key});

  @override
  State<CartBag> createState() => _CartBagState();
}

class _CartBagState extends State<CartBag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF332d2b),
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: new Text('Cart'),
        ),
        backgroundColor: Color(0xFFf7f6f4),
        body: Column(
          children: [
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 20, bottom: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/SDEX GUNDAM EXIA.jpg",
                            height: 70,
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Row(
                            children: [
                              SmallText(text: "Gundam", color: Colors.black54),
                              Padding(padding: EdgeInsets.all(5)),
                              SmallText(
                                  text: "ราคา 240 บาท", color: Colors.black54)
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: 45,
                          height: 45,
                          child: Icon(Icons.attach_money_outlined,
                              color: Colors.white),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ));
  }
}
