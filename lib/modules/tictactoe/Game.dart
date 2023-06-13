import 'dart:math';

import 'package:tictactoe/models/Player.dart';

extension ContainsAll on List {
  bool containsAll(int x, [y, z]) {
    if (z == null && y == null) {
      return contains(x);
    } else if (z == null) {
      return contains(x) && contains(y);
    } else {
      return contains(x) && contains(y) && contains(z);
    }
  }
}

class Game {
  void playGame(int index, String currentPlayer) {
    if (currentPlayer == 'X') {
      Player.listX.add(index);
    } else {
      Player.listO.add(index);
    }
  }

  checkWinner() {
    String winner = '';

    if (Player.listX.containsAll(0, 1, 2) ||
        Player.listX.containsAll(0, 3, 6) ||
        Player.listX.containsAll(0, 4, 8) ||
        Player.listX.containsAll(3, 4, 5) ||
        Player.listX.containsAll(6, 7, 8) ||
        Player.listX.containsAll(1, 4, 7) ||
        Player.listX.containsAll(2, 4, 6) ||
        Player.listX.containsAll(2, 5, 8)) {
      winner = 'X';
    } else if (Player.listO.containsAll(0, 1, 2) ||
        Player.listO.containsAll(0, 3, 6) ||
        Player.listO.containsAll(0, 4, 8) ||
        Player.listO.containsAll(3, 4, 5) ||
        Player.listO.containsAll(6, 7, 8) ||
        Player.listO.containsAll(1, 4, 7) ||
        Player.listO.containsAll(2, 4, 6) ||
        Player.listO.containsAll(2, 5, 8)) {
      winner = 'O';
    } else {
      winner = '';
    }

    return winner;
  }

  void autoPlay(currentPlayer) {
    int index = 0;
    List<int> emptyCell = [];
    for (int i = 0; i < 9; i++) {
      if (!(Player.listX.contains(i) || Player.listO.contains(i))) {
        emptyCell.add(i);
      }
    }

    // Cpu Attack
    if ((Player.listO.containsAll(0, 1)) && emptyCell.contains(2)) {
      index = 2;
    } else if ((Player.listO.containsAll(0, 2)) && emptyCell.contains(1)) {
      index = 1;
    } else if ((Player.listO.containsAll(1, 2)) && emptyCell.contains(0)) {
      index = 0;
    } else if ((Player.listO.containsAll(3, 4)) && emptyCell.contains(5)) {
      index = 5;
    } else if ((Player.listO.containsAll(3, 5)) && emptyCell.contains(4)) {
      index = 4;
    } else if ((Player.listO.containsAll(4, 5)) && emptyCell.contains(3)) {
      index = 3;
    } else if ((Player.listO.containsAll(6, 7)) && emptyCell.contains(8)) {
      index = 8;
    } else if ((Player.listO.containsAll(6, 8)) && emptyCell.contains(7)) {
      index = 7;
    } else if ((Player.listO.containsAll(7, 8)) && emptyCell.contains(6)) {
      index = 6;
    } else if ((Player.listO.containsAll(0, 3)) && emptyCell.contains(6)) {
      index = 6;
    } else if ((Player.listO.containsAll(0, 6)) && emptyCell.contains(3)) {
      index = 3;
    } else if ((Player.listO.containsAll(3, 6)) && emptyCell.contains(0)) {
      index = 0;
    } else if ((Player.listO.containsAll(2, 5)) && emptyCell.contains(8)) {
      index = 8;
    } else if ((Player.listO.containsAll(2, 8)) && emptyCell.contains(5)) {
      index = 5;
    } else if ((Player.listO.containsAll(5, 8)) && emptyCell.contains(2)) {
      index = 2;
    } else if ((Player.listO.containsAll(1, 4)) && emptyCell.contains(7)) {
      index = 7;
    } else if ((Player.listO.containsAll(1, 7)) && emptyCell.contains(4)) {
      index = 4;
    } else if ((Player.listO.containsAll(4, 7)) && emptyCell.contains(1)) {
      index = 1;
    } else if ((Player.listO.containsAll(0, 4)) && emptyCell.contains(8)) {
      index = 8;
    } else if ((Player.listO.containsAll(0, 8)) && emptyCell.contains(4)) {
      index = 4;
    } else if ((Player.listO.containsAll(4, 8)) && emptyCell.contains(0)) {
      index = 0;
    } else if ((Player.listO.containsAll(2, 4)) && emptyCell.contains(6)) {
      index = 6;
    } else if ((Player.listO.containsAll(2, 6)) && emptyCell.contains(4)) {
      index = 4;
    } else if ((Player.listO.containsAll(4, 6)) && emptyCell.contains(2)) {
      index = 2;

      // Cpu Defence
    } else if ((Player.listX.containsAll(0, 1)) && emptyCell.contains(2)) {
      index = 2;
    } else if ((Player.listX.containsAll(0, 2)) && emptyCell.contains(1)) {
      index = 1;
    } else if ((Player.listX.containsAll(1, 2)) && emptyCell.contains(0)) {
      index = 0;
    } else if ((Player.listX.containsAll(2, 1)) && emptyCell.contains(0)) {
      index = 0;
    } else if ((Player.listX.containsAll(3, 4)) && emptyCell.contains(5)) {
      index = 5;
    } else if ((Player.listX.containsAll(3, 5)) && emptyCell.contains(4)) {
      index = 4;
    } else if ((Player.listX.containsAll(4, 5)) && emptyCell.contains(3)) {
      index = 3;
    } else if ((Player.listX.containsAll(5, 4)) && emptyCell.contains(3)) {
      index = 3;
    } else if ((Player.listX.containsAll(6, 7)) && emptyCell.contains(8)) {
      index = 8;
    } else if ((Player.listX.containsAll(6, 8)) && emptyCell.contains(7)) {
      index = 7;
    } else if ((Player.listX.containsAll(7, 8)) && emptyCell.contains(6)) {
      index = 6;
    } else if ((Player.listX.containsAll(8, 7)) && emptyCell.contains(6)) {
      index = 6;
    } else if ((Player.listX.containsAll(0, 3)) && emptyCell.contains(6)) {
      index = 6;
    } else if ((Player.listX.containsAll(0, 6)) && emptyCell.contains(3)) {
      index = 3;
    } else if ((Player.listX.containsAll(3, 6)) && emptyCell.contains(0)) {
      index = 0;
    } else if ((Player.listX.containsAll(6, 3)) && emptyCell.contains(0)) {
      index = 0;
    } else if ((Player.listX.containsAll(2, 5)) && emptyCell.contains(8)) {
      index = 8;
    } else if ((Player.listX.containsAll(2, 8)) && emptyCell.contains(5)) {
      index = 5;
    } else if ((Player.listX.containsAll(5, 8)) && emptyCell.contains(2)) {
      index = 2;
    } else if ((Player.listX.containsAll(1, 4)) && emptyCell.contains(7)) {
      index = 7;
    } else if ((Player.listX.containsAll(1, 7)) && emptyCell.contains(4)) {
      index = 4;
    } else if ((Player.listX.containsAll(4, 7)) && emptyCell.contains(1)) {
      index = 1;
    } else if ((Player.listX.containsAll(7, 4)) && emptyCell.contains(1)) {
      index = 1;
    } else if ((Player.listX.containsAll(0, 4)) && emptyCell.contains(8)) {
      index = 8;
    } else if ((Player.listX.containsAll(0, 8)) && emptyCell.contains(4)) {
      index = 4;
    } else if ((Player.listX.containsAll(4, 8)) && emptyCell.contains(0)) {
      index = 0;
    } else if ((Player.listX.containsAll(8, 4)) && emptyCell.contains(0)) {
      index = 0;
    } else if ((Player.listX.containsAll(2, 4)) && emptyCell.contains(6)) {
      index = 6;
    } else if ((Player.listX.containsAll(2, 6)) && emptyCell.contains(4)) {
      index = 4;
    } else if ((Player.listX.containsAll(4, 6)) && emptyCell.contains(2)) {
      index = 2;
    } else if ((Player.listX.containsAll(4, 2)) && emptyCell.contains(6)) {
      index = 6;
    } else if ((Player.listX.containsAll(4)) && emptyCell.contains(0)) {
      index = 0;
    } else if ((Player.listX.containsAll(4)) && emptyCell.contains(8)) {
      index = 8;
    } else if ((Player.listX.containsAll(4)) && emptyCell.contains(2)) {
      index = 2;
    } else if ((Player.listX.containsAll(4)) && emptyCell.contains(6)) {
      index = 6;
    } else if ((Player.listX.containsAll(0)) && emptyCell.contains(4)) {
      index = 4;
    } else if ((Player.listX.containsAll(1)) && emptyCell.contains(4)) {
      index = 4;
    } else if ((Player.listX.containsAll(2)) && emptyCell.contains(4)) {
      index = 4;
    } else if ((Player.listX.containsAll(3)) && emptyCell.contains(4)) {
      index = 4;
    } else if ((Player.listX.containsAll(5)) && emptyCell.contains(4)) {
      index = 4;
    } else if ((Player.listX.containsAll(6)) && emptyCell.contains(4)) {
      index = 4;
    } else if ((Player.listX.containsAll(7)) && emptyCell.contains(4)) {
      index = 4;
    } else if ((Player.listX.containsAll(8)) && emptyCell.contains(4)) {
      index = 4;
    } else if ((Player.listX.containsAll(0)) && (Player.listX.containsAll(8)) && emptyCell.contains(3)){
      index = 3;
    } else {
      int randomIndex = Random().nextInt(emptyCell.length);
      index = emptyCell[randomIndex];
    }

    playGame(index, currentPlayer);
  }

}
