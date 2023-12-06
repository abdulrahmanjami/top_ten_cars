import 'package:flutter/material.dart';
import 'FirstPage.dart';

main() {
  runApp(myapp2());
}

class myapp2 extends StatelessWidget {
  const myapp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EntopText(),
    );
  }
}
