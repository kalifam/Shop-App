

import 'package:flutter/material.dart';
import 'package:flutter_shopapplication/providers/cart.dart';
import 'package:flutter_shopapplication/screens/cart_screen.dart';
import 'package:flutter_shopapplication/widgets/app_drawer.dart';
import 'package:flutter_shopapplication/widgets/badge.dart';
import 'package:flutter_shopapplication/widgets/products_grid.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
enum FilterOptions{
  Favorites,
  All,
}
 
class ProductsOverviewScreens extends StatefulWidget {
  @override

 _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}
  
class _ProductsOverviewScreenState extends State<ProductsOverviewScreens> {
  var _showOnlyFavorites = false;
  var _isInit=false;
  var _isLoading=true;
@override
void initState(){
//Provider.of<Products>(context).fetchAndSetProducts();
  //Future.delayed(Duration.zero).then((_) {
//Provider.of<Products>(context).fetchAndSetProducts();
 // });
  super.initState();
}
@override
void didChangeDependencies(){
  if(_isInit) {
    setState(() {
      _isLoading=true;
    });
  Provider.of<Products>(context).fetchAndSetProducts().then((_){  
  setState(() {
    _isLoading=false;
  
  });
});
  }
_isInit=false;
super.didChangeDependencies();
}
@override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions:<Widget> [
          PopupMenuButton(
            onSelected: (FilterOptions SelectedValue){
              setState(() {
                if(SelectedValue == FilterOptions.Favorites){
                 _showOnlyFavorites =true;
                }
                else{
                  _showOnlyFavorites =false;
                }
                });
            },
            icon:Icon(
              Icons.more_vert,
            ),
            itemBuilder:(_)=>[
              PopupMenuItem(
                child:Text('only Favorites'),
                value:FilterOptions.Favorites,
                 ),
                 PopupMenuItem(
                   child:Text('shows All'),
                   value: FilterOptions.All, 

            ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
                
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),

      
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              }, 
              ),
              
                 value: cart.itemCount.toString(), 
                  color:Colors.red,
                ),
          ),     
        ],
      ),
        drawer: AppDrawer(),
      body: _isLoading ? Center(
        child: CircularProgressIndicator(),
      )
      :ProductsGrid(_showOnlyFavorites),
    );
  }
}





