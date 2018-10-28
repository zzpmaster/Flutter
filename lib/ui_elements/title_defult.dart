import 'package:flutter/material.dart';

class TitleDefault extends StatelessWidget {
  final String title;

  TitleDefault(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
          // 设置字体, 也可以在全局设置 main.dart
          fontFamily: 'Oswald'),
    );
  }
}
