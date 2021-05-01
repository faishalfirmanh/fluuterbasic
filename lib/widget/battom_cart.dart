import 'package:flutter/material.dart';
import 'package:flutterkos/theme.dart';

class BattomCart extends StatelessWidget{

  final String imgUrl;
  final bool isActive;

  BattomCart({this.imgUrl, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imgUrl,
          width: 26,
        ),
        Spacer(),
        isActive ?
        Container(
          width: 30,
          height: 4,
          decoration: BoxDecoration(
            color: ungu,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(1000),
            ),
          ),
        )
        :
        Container(
          
        )
      ],
    );
  }
}