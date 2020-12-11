import 'file:///E:/booster_fluter_course/Projects/api_medical_mvp/lib/ui/Main_screen_of_all_cards.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API',
      home: Stack(
        children: [
          AllCards(),
        ],
      ),
    );
  }
}
