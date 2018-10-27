import 'package:flutter/material.dart';

import 'product_create.dart';
import 'product_list.dart';
import 'home.dart';

class ProductsAdmin extends StatelessWidget {

  final Function addProduct;
  final Function deleteProduct;

  ProductsAdmin({this.addProduct, this.deleteProduct});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
            child: Column(
          children: <Widget>[
            AppBar(title: Text('Choose')),
            ListTile(
              title: Text('All Products'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/products');
              },
            )
          ],
        )),
        appBar: AppBar(
          title: Text('Manage Products'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Create Product',
                icon: Icon(Icons.create),
              ),
              Tab(
                text: 'My Product',
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[ProductCreatePage(addProduct), ProductListPage()],
        ),
      ),
    );
  }
}
