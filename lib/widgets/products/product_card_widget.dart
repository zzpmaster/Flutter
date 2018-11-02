import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './price_widget.dart';
import '../../ui_elements/title_defult.dart';
import './address_widget.dart';

import '../../models/product.dart';
import '../../scoped-models/products.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  final int productIndex;

  ProductCardWidget(this.product, this.productIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(product.image),
        // 有几种方式可以增加占位元素  sizebox和container (padding/margin [ only、all、symmetric ])
        // 也可以使用Padding的widget
        // margin：外边距增加10像素
        // padding: 内边距增加10像素
        Container(
          // padding: EdgeInsets.only(top: 10.0),
          margin: EdgeInsets.only(top: 10.0),
          // margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // 也可以使用Center将2个元素居中
              Expanded(
                child: TitleDefault(product.title),
              ),
              SizedBox(
                width: 8.0,
              ),
              // 装饰盒 DecoratedBox, 是不能设置 长宽padding，margin的
              PriceWidget(price: product.price),
            ],
          ),
        ),
        AddressWidget('Union Square, San Francisco'),
        // adding buttons
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              color: Theme.of(context).accentColor,
              // 68. push a page
              onPressed: () => Navigator.pushNamed<bool>(
                  context, '/product/' + productIndex.toString()),
              //     .then((bool value) {
              //   if (value) {
              //     deleteProduct(index);
              //   }
              // }),
            ),
            ScopedModelDescendant<ProductsModel>(builder:
                (BuildContext context, Widget child, ProductsModel model) {
                  // print(model.dispalyProducts[productIndex].isFavorite);
              return IconButton(
                icon: Icon(model.dispalyProducts[productIndex].isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                color: Colors.red,
                onPressed: () {
                  model.selectProduct(productIndex);
                  model.toggleProductFavoriteStatus();
                },
              );
            }),
          ],
        )
      ],
    );
  }
}
