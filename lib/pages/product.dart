import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../ui_elements/title_defult.dart';

import '../models/product.dart';
import '../scoped-models/products.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;

  ProductPage(this.productIndex);

  _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This action cannot be undone!'),
            actions: <Widget>[
              FlatButton(
                child: Text('DISCARD'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('CONTINUE'),
                onPressed: () {
                  Navigator.pop(context); // 先关闭dialog
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
  }

  Widget _buildAddressPriceRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Union Square, San Francisco',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '|',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Text(
          '\$${price.toString()}',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // 当点击返回按钮或者物理按键时，调用
        Navigator.pop(context, false);
        // 如果返回的是false，点击返回或物理按键无效。
        // 注意，不可以设置true，原因已经pop到root页面中。设置true相当于又pop一次
        return Future.value(false);
      },
      child: ScopedModelDescendant<ProductsModel>(
        builder: (BuildContext context, Widget child, ProductsModel model) {
          final Product prodcut = model.products[productIndex];
          return Scaffold(
            appBar: AppBar(title: Text(prodcut.title)),
            body: Center(
              child: Column(
                  // 垂直居中
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // 水平居中
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(prodcut.image),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: TitleDefault(prodcut.title),
                    ),
                    _buildAddressPriceRow(prodcut.price),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                      child: Text(
                        prodcut.description,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
