import 'package:flutter/material.dart';

import '../theme.dart';

class FacilityItem extends StatelessWidget{
  final String name;
  final String imgUrl;
  final int numberItem;


  FacilityItem({this.name, this.imgUrl, this.numberItem});


  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(imgUrl,
        width:32
        ),
        SizedBox(
          height:8
        ),
         Text.rich(
          TextSpan(
          // ignore: unnecessary_brace_in_string_interps
          text: '${numberItem}',
          style:purpleTextStyle.copyWith(
            fontSize:14
          ),
          children:[
            TextSpan(
              text: name,
              style: greyTextStyle.copyWith(
                fontSize:14
              )
            ),
            ]
          )
        ),
      ],
    );
  }
}