import 'package:flutter/material.dart';

import '../product_manager.dart';
import './products_admin.dart';

/// adding Multiple pages
class HomePage extends StatelessWidget {
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProductsAdmin()));
              })
        ],
      )),
      appBar: AppBar(
        title: Text('EasyList'),
      ),
      body: ProductManager(),
    );
  }
}
