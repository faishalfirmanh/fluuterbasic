
import 'package:flutter/material.dart';
import 'package:flutterkos/models/tips.dart';
import 'package:flutterkos/theme.dart';


class TipsCard extends StatelessWidget{
  final Tips tips;
  TipsCard(this.tips);
  Widget build(BuildContext context)
  {
    return Row(
      children: [
        Image.asset(tips.imgUrl,
        width:80
        ),
        SizedBox(
          width:16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tips.title,
            style: blackTextStyle.copyWith(
              fontSize:18
            ),
            ),
            SizedBox(
              height:14,
            ),
            Text('updated ${tips.updated}',
              style: greyTextStyle,
            )
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.chevron_right,
            color: abuabu,
            ),
          )
      ],
    );
  }

}