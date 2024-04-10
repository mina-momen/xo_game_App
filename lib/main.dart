import 'package:flutter/material.dart';
import 'package:xogame/screenplayer.dart';


import 'loginscreen.dart';


void main() {
  runApp(MyApplication());
}
class MyApplication extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Login_Screen.routename,
        routes: {Login_Screen.routename:(context)=>Login_Screen(),
          Screen_Player.routename:(context)=>Screen_Player(),

        },
      );
  }

}
