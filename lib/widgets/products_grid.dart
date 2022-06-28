import 'package:flutter/material.dart';
import 'package:flutter_shopapplication/providers/products.dart';
import 'package:flutter_shopapplication/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool ShowFavs; 
  
  ProductsGrid(this.ShowFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = ShowFavs ? productsData.favoriteItems : productsData.items;
    
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
         //builder: (c)=>products[i],
              //create: (c) => products[i],
              value: products[i],
              child: ProductItem(
                  //products[i].id,
                  // products[i].title,
                  // products[i].imageUrl,
                  ),
            ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        );
  }
}