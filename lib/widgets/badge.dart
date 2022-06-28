// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unnecessary_null_comparison, deprecated_member_use, prefer_if_null_operators

import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key? Key,
    required this.child,
    required this.value,
    required this.color,
  }) : super(key: Key);

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color != null ? color : Theme.of(context).accentColor,
            ),
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        )
      ],
    );
  }
}
