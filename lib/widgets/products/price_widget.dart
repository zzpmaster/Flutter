import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final double price;

  PriceWidget({this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.4),
      // 在container中也可以使用BoxDecoration, 用来设置边框等
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        '\$${price.toString()}',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
