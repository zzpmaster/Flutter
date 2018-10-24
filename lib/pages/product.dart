import 'dart:async';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

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
      child: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: Column(
              // 垂直居中
              // mainAxisAlignment: MainAxisAlignment.center,
              // 水平居中
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(imageUrl),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(title),
                ),
                Container(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text('DELETE'),
                      onPressed: () => Navigator.pop(context, true),
                    )),
              ]),
        ),
      ),
    );
  }
}
