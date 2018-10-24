import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/auth.dart';

void main() {
  // 可以debug查看UI控件的大小
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // this is core root widget.
    return MaterialApp(
        // debugShowMaterialGrid: true, 可以看到像素点
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: AuthPage());
  }
}
