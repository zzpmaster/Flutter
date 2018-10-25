import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

// class ProductManager extends StatefulWidget {
//   final Map<String, String> startingProduct;

//   // named 参数。在调用时，需要指定名字
//   ProductManager({this.startingProduct});

//   @override
//   State<StatefulWidget> createState() {
//     return _ProductManagerState();
//   }
// }

// class _ProductManagerState extends State<ProductManager> {
//   List<Map<String, String>> _products = [];

//   @override
//   void initState() {
//     super.initState();
//     // 初始化数据 如果为null，就不像数组中添加
//     // Rendering Content Conditionally 有条件的渲染
//     if (widget.startingProduct != null) {
//       _products.add(widget.startingProduct);
//     }
//   }
class ProductManager extends StatelessWidget {

  final List<Map<String, String>> products;

  final Function addProduct;
  final Function deleteProduct;

  ProductManager({this.products, this.addProduct, this.deleteProduct});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(addProduct),
        ),
        // expanded 会将包含的UI扩展到屏幕的剩余空间
        Expanded(
          child: Products(products, deleteProduct: deleteProduct),
        )
      ],
    );
  }
}
