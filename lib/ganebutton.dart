import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Game_Button extends StatelessWidget {
  String text;
  int index;
  Function ongameclick;
  var color = 0xff02c39a;

  Game_Button(this.text, this.ongameclick, this.index);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          ongameclick(index);
        },
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 70,
            color: text == 'X' ? Color(0xff4cc9f0) : Color(0xfff72585),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(width: 3, color: Colors.white)
          ),
        ),
      ),
    );
  }
}
