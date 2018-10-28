import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {

  final String address;

  AddressWidget(this.address);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(6.0)),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.4),
              child: Text(
                address,
              )),
        );
  }

}