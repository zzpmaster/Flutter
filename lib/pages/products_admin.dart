import 'package:flutter/material.dart';

import 'product_edit.dart';
import 'product_list.dart';

class ProductsAdmin extends StatelessWidget {
  // final Function addProduct;
  // final Function deleteProduct;
  // final Function updateProduct;
  // final List<Product> products;

  // ProductsAdmin({this.addProduct, this.updateProduct, this.deleteProduct, this.products});

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(title: Text('Choose')),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('All Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
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
          children: <Widget>[
            ProductEditPage(),
            ProductListPage()
          ],
        ),
      ),
    );
  }
}
