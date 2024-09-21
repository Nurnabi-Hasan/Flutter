
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key, required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textColor: Colors.black,
      tileColor: Colors.grey,
      title: Text('${product.productName}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${product.productCode}'),
          Text('Quantity: ${product.productQuantity}'),
          Text('Unit Price: \$${product.unitPrice}'),
          Text('Total Price: \$${product.totalPrice}'),

          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(onPressed: () {},
                icon: Icon(Icons.edit,),
                label: Text('Edit'),),
              TextButton.icon(onPressed: () {},
                icon: Icon(Icons.delete, color: Colors.red.shade800,),
                label: Text('Delete', style: TextStyle(
                    color: Colors.red.shade800),),),
            ],
          )

        ],
      ),

    );
  }
}
*/
