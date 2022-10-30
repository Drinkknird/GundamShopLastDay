import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/exaw.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        // use any child here
        child: Padding(
          padding: EdgeInsets.fromLTRB(50, 0, 20, 0),
          child: Container(
            padding: const EdgeInsets.all(0.0),
            //color: Color.fromARGB(48, 167, 203, 232),
            width: 400.0,
            height: 300.0,
            child: const Text(
              'Gundam Shop',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 110, 255),
                  fontFamily: 'Roboto',
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ), //Container
        ),
      ),
    );
  }
  //You
}
