import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cars/MainPage.dart';
import 'package:flutter/material.dart';

main() {
  runApp(EntopText());
}

class EntopText extends StatefulWidget {
  const EntopText({super.key});

  @override
  State<EntopText> createState() => _EntopTextState();
}

class _EntopTextState extends State<EntopText> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyNew()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
        child: Container(
            width: 200,
            child: DefaultTextStyle(
                style: TextStyle(
                    fontFamily: 'Horizon',
                    fontSize: 35,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                          blurRadius: 7.0,
                          color: Colors.white,
                          offset: Offset(0, 0))
                    ]),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FlickerAnimatedText('ENTOP'),
                    FlickerAnimatedText('BUGATTI'),
                    FlickerAnimatedText('FERRARI'),
                  ],
                ))),
      )),
    );
  }
}
