import 'package:flutter/material.dart';
import 'package:flutterkos/pages/home_page.dart';
import 'package:flutterkos/theme.dart';

class ErrorPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        bottom:false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Image.asset('assets/404.png', width:300),
              SizedBox(
                height:70
              ),
              Text('Where you Going ?', style: blackTextStyle.copyWith(
                fontSize:24
              ),
              ),
              SizedBox(
                height:14
              ),
              Text('Seems like the page that you were \n requested is already gone',
                style: greyTextStyle.copyWith(
                  fontSize:16
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height:50
              ),
              Container(
                width: 210,
                height: 50,
                child: RaisedButton(
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                      builder: (context)=>HomePage(),
                    ),
                    (route)=>false);
                  },
                  color: ungu,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)
                  ),
                  child: Text('Back to home', style: whiteTextStyle.copyWith(
                    fontSize:18
                  )),
                ),
              )
            ]
          ),
        )
      ),
    );
  }

}