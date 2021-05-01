import 'package:flutter/material.dart';
import 'package:flutterkos/pages/splash_page.dart';
import 'package:flutterkos/provider/spaces_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
   return ChangeNotifierProvider(
     create: (context) => SpacesProvider(),
     child: MaterialApp(
       home: SplashPage(),
     ),
   );
    
  }
  
}