import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xogame/loginscreen.dart';
import 'ganebutton.dart';

class Screen_Player extends StatefulWidget {
  static const String routename = 'Screen_Player';

  @override
  State<Screen_Player> createState() => _Screen_PlayerState();
}

class _Screen_PlayerState extends State<Screen_Player> {
  List<String> board = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  int score1 = 0, score2 = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor:  Colors.black87,
          appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text("XO Game", style: TextStyle(
                    color: Colors.white, fontSize: 30,
                    fontStyle: FontStyle.italic,
                    shadows: [Shadow(color: Colors.grey, blurRadius: 5, offset: Offset(3, 3))
                    ])),),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Expanded(
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(player1, style: TextStyle(
                          fontStyle: FontStyle.italic,
                          shadows: [
                            Shadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(1, 1))
                          ],
                                color: Color(0xff4cc9f0), fontSize: 30,
                                fontWeight: FontWeight.bold),),
                          Text("$score1", style: TextStyle(
                                color: Color(0xff4cc9f0), fontSize: 25,
                                fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("VS",style: TextStyle(
                          fontStyle: FontStyle.normal,
                          shadows: [
                            Shadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(3, 3))
                          ],
                          color: Colors.white, fontSize: 50,
                          fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            player2,
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                shadows: [
                                  Shadow(
                                      color: Colors.grey,
                                      blurRadius: 3,
                                      offset: Offset(1, 1))
                                ],
                                color: Color(0xfff72585),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Text("$score2", style: TextStyle(
                                color: Color(0xfff72585), fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Game_Button(board[0], onclicked, 0),
                      Game_Button(board[1], onclicked, 1),
                      Game_Button(board[2], onclicked, 2),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Game_Button(board[3], onclicked, 3),
                      Game_Button(board[4], onclicked, 4),
                      Game_Button(board[5], onclicked, 5),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Game_Button(board[6], onclicked, 6),
                      Game_Button(board[7], onclicked, 7),
                      Game_Button(board[8], onclicked, 8),
                    ],
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          )),
    );
  }

  int counter = 1;

  void onclicked(index) {
    if (board[index].isNotEmpty) return;
    if (counter.isOdd) {
      board[index] = "X";
      bool win = checkwinner("X");
      if (win) {
        score1++;
        restboard();
      }
    } else {
      board[index] = "O";
      bool win = checkwinner("O");
      if (win) {
        score2++;
        restboard();
      }
    }
    if (counter == 9) {
      restboard();
    }
    setState(() {});
    counter++;
  }

  void restboard() {
    board = [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
    ];
    counter = 0;
  }

  bool checkwinner(String symbol) {
    for (int i = 0; i <= 6; i += 3) {
      if (board[i] == symbol &&
          board[i + 1] == symbol &&
          board[i + 2] == symbol) return true;
    }
    for (int i = 0; i < 3; i++) {
      if (board[i] == symbol &&
          board[i + 3] == symbol &&
          board[i + 6] == symbol) return true;
    }
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol)
      return true;
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol)
      return true;
    return false;
  }
}
