import 'package:flutter/material.dart';
import 'package:flutterkos/pages/home_page.dart';
import 'package:flutterkos/theme.dart';

class SplashPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     body: SafeArea(
       child: Stack(
         children: [
           Align(
             alignment: Alignment.bottomCenter,
             child: Image.asset('assets/splash_image.png')),
           Padding(
           padding: EdgeInsets.only(
             top:30,
             left:50
           ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
               height: 40,
               width: 40,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage('assets/logo.png'),
                 ),
                 ),
             ),
             SizedBox(
               height:10,
             ),
             Text(
               'Find Cozzy House \n to Stay and happy', style: blackTextStyle.copyWith(
                 fontSize:24
               ),
               ),
               SizedBox(
                 height:10
               ),
               Text(
                 'Stop membuang banyak waktu \n pada tempat yang tidak habitable', style: greyTextStyle.copyWith(
                   fontSize:16
                 )
               ),
               SizedBox(
                 height:40
               ),
               Container(
                 width: 210,
                 height: 50,
                 child: RaisedButton(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(18)
                     ),
                   color: ungu,
                   onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                   },
                   child: Text('Explored Now', 
                   style: whiteTextStyle.copyWith(
                     fontSize:18
                   )
                   ),
                 ),
               )
           ],
           ),
         ),
         ],
       ),
       ),
    );
  }
}