import 'package:flutter/material.dart';

import '../product_manager.dart';

/// adding Multiple pages
class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  HomePage(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 左边菜单：drawer, 右侧菜单：endrawer
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          AppBar(
            // 打开菜单后隐藏 icon图标
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
              title: Text('Manage Products'),
              onTap: () {
                // 全局路由
                Navigator.pushReplacementNamed(context, '/admin');
              })
        ],
      )),
      appBar: AppBar(
        title: Text('EasyList'),
      ),
      body: ProductManager(
        products: products,
      ),
    );
  }
}
