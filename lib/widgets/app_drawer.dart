

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shopapplication/screens/orders_screen.dart';
import 'package:flutter_shopapplication/screens/user_products_screen.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class AppDrawer extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Column(children:<Widget> [
        AppBar(
          title: Text('hello besties!!'),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.shop ),
            title: Text('shop'),
            onTap: (){
          Navigator.of(context).pushReplacementNamed('/');
          
        },
        ),
        Divider(),
         ListTile(
          leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrederScreen.routeName);
        },
         ),
        Divider(),
         ListTile(
          leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
                   },
                  ),
        Divider(),
         ListTile(
          leading: Icon(Icons.exit_to_app),
            title: Text('logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
             // Navigator.of(context)
               //   .pushReplacementNamed(UserProductsScreen.routeName);
                   Provider.of<Auth>(context,listen: false).logout();
                   },
                  ),
      ],)
    );
  }
}