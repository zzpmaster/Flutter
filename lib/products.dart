import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;

  // 可选参数, 默认是需要添加const
  // 如果不传递值，那么之后将无法修改products
  Products([this.products = const []]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products
          .map(
            (item) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/food.jpg'),
                      Text(item)
                    ],
                  ),
                ),
          )
          .toList(),
    );
  }
}
