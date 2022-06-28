// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_shopapplication/providers/cart.dart';
import 'package:flutter_shopapplication/providers/product.dart';
import 'package:flutter_shopapplication/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,listen: false);
    final cart= Provider.of<Cart>(context,listen: false);
    
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
            // MaterialPageRoute(builder: (ctx) => ProductDetailScreen(title)),
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading:Consumer<Product>(
            builder:(ctx, Product, child)=> IconButton(
            icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                 color: Theme.of(context).accentColor,
            onPressed: () {
              product.toggleFavoriteStatus();
            },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
              Scaffold.of(context).hideCurrentSnackBar();
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content:Text(
            'Added item to the cart!',textAlign:TextAlign.center ,) ,
      duration:Duration(seconds: 2),
      action:SnackBarAction(label: 'UNDO',onPressed: () {
      cart.removeSingleItem(product.id);
      }),
      
      ),);
            },
            color: Theme.of(context).accentColor,
          ),
          
        ),
      ),
    );
  }
}

