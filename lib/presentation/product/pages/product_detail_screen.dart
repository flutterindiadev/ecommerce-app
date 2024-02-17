import 'package:ecommerceapp/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailScreen({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          productEntity.title,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Row(
                  children: [
                    Text(
                      "\$${productEntity.price.toString()}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    )
                  ],
                ),
                Hero(
                    tag: productEntity.id,
                    child: ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 400),
                        child: Image.network(productEntity.imgUrl))),
                Text(
                  productEntity.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(productEntity.desc)
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.maxFinite,
              height: 50,
              decoration: const BoxDecoration(color: Colors.amber),
              child: const Center(
                  child: Text(
                'Add to cart',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      ),
    );
  }
}
