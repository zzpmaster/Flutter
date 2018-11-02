import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
// import 'package:flutter/rendering.dart';

import './scoped-models/products.dart';
import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/home.dart';
import './pages/product.dart';

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
  @override
  Widget build(BuildContext context) {
    // this is core root widget.
    return ScopedModel<ProductsModel>(
      model: ProductsModel(),
      child: MaterialApp(
        // debugShowMaterialGrid: true, 可以看到像素点
        theme: ThemeData(
          // 夜晚百白天模式
          brightness: Brightness.light,
          primarySwatch: Colors.pink,
          // 设置全局字体
          // fontFamily: 'Oswald'
        ),
        // home: AuthPage(),
        // add named routes
        // 全局路由
        routes: {
          // '/'与home: AuthPage(), 不能一起使用
          '/': (BuildContext context) => AuthPage(),
          '/products': (BuildContext context) => HomePage(),
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
                    ProductPage(index));
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => HomePage());
        },
      ),
    );
  }
}
