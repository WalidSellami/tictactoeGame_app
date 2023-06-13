import 'package:flutter/material.dart';
import 'package:tictactoe/models/Player.dart';
import 'package:tictactoe/modules/tictactoe/Game.dart';
import 'dart:math';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  String currentPlayer = 'X';
  bool gameOver = false;
  int turn = 0;
  Game game = Game();
  bool isCheck = false;

  String text1 = 'Click to play in mode 2 players';
  String text2 = 'You are in mode 2 players';

  int score1 = 0;
  int score2 = 0;

  Color color = Colors.white;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(
            fontSize: 22.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10.0,),
          CheckboxListTile(
              title: Text(
                isCheck ? text2 : text1,
                style: const TextStyle(
                  fontSize: 19.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              activeColor: Colors.blueGrey.shade600,
              value: isCheck,
              onChanged: (bool? value) {
                setState(() {
                  isCheck = value!;
                  text1 = 'You are in mode 1 player';
                  score1 = 0;
                  score2 = 0;
                  Player.listX = [];
                  Player.listO = [];
                });
              }),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            '$currentPlayer\'s turn',
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: Stack(
              children: [
                GridView.count(
                  padding: const EdgeInsets.symmetric(
                     horizontal: 20.0,
                  ),
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  children: List.generate(9, (index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(12.0),
                      onTap: () {
                        (gameOver || turn == 9) ? showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                title: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'game over'.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        turn = 0;
                                        currentPlayer = 'X';
                                        gameOver = false;
                                        Player.listX = [];
                                        Player.listO = [];
                                        Navigator.pop(context);
                                      });
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStatePropertyAll(Colors.blueGrey.shade600),
                                    ),
                                    child: const Text(
                                      'Restart',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }) :  _onTap(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade100,
                          // (Player.listX.contains(index)) ? Colors.red.shade600
                          //  : (Player.listO.contains(index)) ? Colors.blue.shade700 : Colors.black26.withOpacity(.2),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            Player.listX.contains(index)
                                ? 'X'
                                : Player.listO.contains(index)
                                ? 'O'
                                : '',
                            style: TextStyle(
                              color: (Player.listX.contains(index)) ? Colors.red : Colors.blue.shade700,
                              fontSize: 70.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50.0,
                    vertical: ((Player.listX.containsAll(0, 1, 2)) || (Player.listO.containsAll(0, 1, 2))) ? 48.0 : 0.0,
                  ),
                  child: Divider(
                    thickness: 5,
                    color: ((Player.listX.containsAll(0, 1, 2))) ? Colors.red.shade500 :  (Player.listO.containsAll(0, 1, 2)) ? Colors.blue.shade600 : Colors.transparent,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 50.0,
                      right: 50.0,
                      bottom: ((Player.listX.containsAll(3, 4, 5)) || (Player.listO.containsAll(3, 4, 5))) ? 76.0 : 0.0,
                    ),
                    child: Divider(
                      thickness: 5,
                      color: ((Player.listX.containsAll(3, 4, 5))) ? Colors.red.shade500 :  (Player.listO.containsAll(3, 4, 5)) ? Colors.blue.shade600 : Colors.transparent,

                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 50.0,
                    right: 50.0,
                    bottom: ((Player.listX.containsAll(6, 7, 8)) || (Player.listO.containsAll(6, 7, 8))) ? 125.0 : 0.0,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Divider(
                      thickness: 5,
                      color: ((Player.listX.containsAll(6, 7, 8))) ? Colors.red.shade500 :  (Player.listO.containsAll(6, 7, 8)) ? Colors.blue.shade600 : Colors.transparent,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 70.0,
                      left: 50.0,
                      right: 50.0,
                    ),
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: Divider(
                        thickness: 4,
                        color: ((Player.listX.containsAll(1, 4, 7))) ? Colors.red.shade500 :  (Player.listO.containsAll(1, 4, 7)) ? Colors.blue.shade600 : Colors.transparent,
                      ),
                    ),
                  ),
                ),
                Padding(
                 padding: const EdgeInsets.only(
                   left: 68.0,
                   bottom: 102.0,
                   top: 26.0,
                 ),
                 child: VerticalDivider(
                   thickness: 4,
                   color: ((Player.listX.containsAll(0, 3, 6))) ? Colors.red.shade500 :  (Player.listO.containsAll(0, 3, 6)) ? Colors.blue.shade600 : Colors.transparent,
                 ),
               ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 102.0,
                      top: 26.0,
                      right: 68.0,
                    ),
                    child: VerticalDivider(
                      thickness: 4,
                      color: ((Player.listX.containsAll(2, 5, 8))) ? Colors.red.shade500 :  (Player.listO.containsAll(2, 5, 8)) ? Colors.blue.shade600 : Colors.transparent,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 165.0,
                  ),
                  child: Transform.rotate(
                   angle: pi / 4,
                    child: Divider(
                      thickness: 4,
                      color: ((Player.listX.containsAll(0, 4, 8))) ? Colors.red.shade500 :  (Player.listO.containsAll(0, 4, 8)) ? Colors.blue.shade600 : Colors.transparent,
                     ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 165.0,
                  ),
                  child: Transform.rotate(
                    angle: pi / 1.33,
                    child: Divider(
                      thickness: 4,
                        color: ((Player.listX.containsAll(2, 4, 6))) ? Colors.red.shade500 :  (Player.listO.containsAll(2, 4, 6)) ? Colors.blue.shade600 : Colors.transparent,
                    ),
                  ),
                ),

              ],
            ),
          ),
          Text(
            isCheck ? 'Player X won : $score1' : 'You won : $score1',
            style: const TextStyle(
              fontSize: 22.0,
              // fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            isCheck ? 'Player O won : $score2' : 'Cpu won : $score2',
            style: const TextStyle(
              fontSize: 22.0,
              // fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                turn = 0;
                currentPlayer = 'X';
                gameOver = false;
                Player.listX = [];
                Player.listO = [];
                score1 = 0;
                score2 = 0;
              });
            },
            label: const Text(
              'Reset',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            icon: const Icon(
              Icons.refresh_outlined,
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(120, 40),
              backgroundColor: Colors.blueGrey.shade700,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  _onTap(int index) {
    if ((Player.listX.isEmpty || !(Player.listX.contains(index))) &&
        (Player.listO.isEmpty || !(Player.listO.contains(index)))) {
      game.playGame(index, currentPlayer);
      updateState();

      if (!isCheck && !gameOver && turn != 9) {
        game.autoPlay(currentPlayer);
        updateState();
      }
    }
  }

  void updateState() {
    setState(() {
      currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
      turn++;

      String winnerPlayer = game.checkWinner();
      if (!gameOver && turn == 9) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                title: Text(
                  'game over'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text(
                        'No one won!',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        turn = 0;
                        currentPlayer = 'X';
                        gameOver = false;
                        Player.listX = [];
                        Player.listO = [];
                        Navigator.pop(context);
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(Colors.blueGrey.shade600),
                    ),
                    child: const Text(
                      'Restart',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            });
      } else if (winnerPlayer == 'X' || winnerPlayer == 'O') {
        if (winnerPlayer == 'X') {
          score1++;
        } else {
          score2++;
        }
        gameOver = true;
        gameOver
            ? showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                title: Text(
                  'game over'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text(
                        isCheck
                            ? 'Player $winnerPlayer has won!'
                            : ((winnerPlayer == 'X')
                            ? 'You won!'
                            : 'Cpu won!'),
                        style: TextStyle(
                          color: (winnerPlayer == 'X') ? Colors.red.shade600 : Colors.blue.shade700,
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        turn = 0;
                        currentPlayer = 'X';
                        gameOver = false;
                        Player.listX = [];
                        Player.listO = [];
                        Navigator.pop(context);
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(Colors.blueGrey.shade600),
                    ),
                    child: const Text(
                      'Restart',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            })
            : null;
      }
    });
  }
}