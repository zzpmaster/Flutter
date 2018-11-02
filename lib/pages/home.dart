import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../widgets/products/products.dart';

import '../scoped-models/products.dart';

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
              leading: Icon(Icons.edit),
              title: Text('Manage Products'),
              onTap: () {
                // 全局路由
                Navigator.pushReplacementNamed(context, '/admin');
              }),
        ],
      )),
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[
          ScopedModelDescendant<ProductsModel>(builder:
              (BuildContext context, Widget child, ProductsModel model) {
            return IconButton(
              icon: Icon(model.displayFavoriteOnly ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                model.toggleDisplayMode();
              },
            );
          })
        ],
      ),
      body: Products(),
    );
  }
}
