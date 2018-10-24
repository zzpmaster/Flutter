import 'package:flutter/material.dart';

import './pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  // 可选参数, 默认是需要添加const
  // 如果不传递值，那么之后将无法修改products
  // Products([this.products = const []]);
  Products(this.products, {this.deleteProduct});

  Widget _buildProductItem(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        Image.asset(products[index]['image']),
        Text(products[index]['title']),
        // adding buttons
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('Details'),
              // 68. push a page
              onPressed: () => Navigator.push<bool>(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        // Passing Data Around and pushing the page
                        ProductPage(
                            products[index]['title'], products[index]['image']),
                  )).then((bool value) {
                    if (value) {
                      deleteProduct(index);
                    }
                  }),
            )
          ],
        )
      ],
    );
  }

  Widget _buildProductList() {
    // 4.
    // 用更好的方式来替换 方式3的判断
    // Alternative Approaches to Render Content Conditionally
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productCard = Center(
        child: Text('No products found, Please add some'),
      );

      // 你也可以生成一个空的组件
      // productCard = Container();
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    //4.
    return _buildProductList();

    // 2.
    // ListView.builder 可以优化list性能，将屏幕外的元素释放
    // Optimizing the List Loading Behavior
    // return ListView.builder(
    //   itemBuilder: _buildProductItem,
    //   itemCount: products.length,
    // );

    // 3.
    // Rendering Content Conditionally 有条件的渲染
    // return products.length > 0
    //     ? ListView.builder(
    //         itemBuilder: _buildProductItem,
    //         itemCount: products.length,
    //       )
    //     : Center(
    //         child: Text('No products found, Please add some'),
    //       );

    // 1.
    // 如果是固定的列表，可以使用ListView
    // return ListView(
    //   children: products
    //       .map(
    //         (item) => Card(
    //               child: Column(
    //                 children: <Widget>[
    //                   Image.asset('assets/food.jpg'),
    //                   Text(item)
    //                 ],
    //               ),
    //             ),
    //       )
    //       .toList(),
    // );
  }
}
