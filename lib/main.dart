import 'package:first_app/pages/product.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/home.dart';
import './products.dart';

void main() {
  // 可以debug查看UI控件的大小
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> _products = [];

  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // this is core root widget.
    return MaterialApp(
      // debugShowMaterialGrid: true, 可以看到像素点
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // home: AuthPage(),
      // add named routes
      // 全局路由
      routes: {
        // '/'与home: AuthPage(), 不能一起使用
        '/': (BuildContext context) =>
            HomePage(_products, _addProduct, _deleteProduct),
        '/admin': (BuildContext context) => ProductsAdmin()
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
              builder: (BuildContext context) =>
                  // Passing Data Around and pushing the page
                  ProductPage(
                      _products[index]['title'], _products[index]['image']));
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                HomePage(_products, _addProduct, _deleteProduct));
      },
    );
  }
}
