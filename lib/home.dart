// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String turn = "x";
  int ScoreX = 0;
  int ScoreO = 0;
  int filledBoxes = 0;
  List<String> gridlist = ["", "", "", "", "", "", "", "", ""];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Player X",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 230, 0)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      ScoreX.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.grey[100]),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Player O",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 230, 0)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      ScoreO.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.grey[100]),
                    )
                  ],
                )
              ],
            )),
            SizedBox(
              width: 400,
              height: 400,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {
                        _played(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white70)),
                        child: Center(
                          child: Text(
                            gridlist[index],
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text.rich(
                    TextSpan(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        TextSpan(
                            text: turn,
                            style: TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 255, 230, 0))),
                        TextSpan(
                            text: '\'s Turn',
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 20),
                            primary: Color.fromARGB(255, 255, 230, 0),
                          ),
                          onPressed: () {
                            _clear_board();
                            filledBoxes = 0;
                          },
                          child: Text(
                            'Clear Board',
                            style: TextStyle(color: Colors.grey[800]),
                          )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 20),
                            primary: Color.fromARGB(255, 255, 230, 0),
                          ),
                          onPressed: () {
                            _clear_board();
                            ScoreX = 0;
                            ScoreO = 0;
                            filledBoxes = 0;
                          },
                          child: Text(
                            'Reset Score',
                            style: TextStyle(color: Colors.grey[800]),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  void _played(int index) {
    setState(() {
      if (gridlist[index] == '') {
        turn == "o" ? gridlist[index] = "o" : gridlist[index] = "x";
        gridlist[index] == "o" ? turn = "x" : turn = "o";
        filledBoxes++;
      }
      _check_win();
      if (_isDraw()) {
        _showDraw();
      }
    });
  }

  void _check_win() {
    if (gridlist[0] == gridlist[1] &&
        gridlist[0] == gridlist[2] &&
        gridlist[0] != '') {
      _show_winner(gridlist[0]);
      filledBoxes = 0;
    }
    if (gridlist[3] == gridlist[4] &&
        gridlist[3] == gridlist[5] &&
        gridlist[3] != '') {
      _show_winner(gridlist[3]);
      filledBoxes = 0;
    }
    if (gridlist[6] == gridlist[7] &&
        gridlist[6] == gridlist[8] &&
        gridlist[6] != '') {
      _show_winner(gridlist[6]);
      filledBoxes = 0;
    }
    if (gridlist[0] == gridlist[3] &&
        gridlist[0] == gridlist[6] &&
        gridlist[0] != '') {
      _show_winner(gridlist[0]);
      filledBoxes = 0;
    }
    if (gridlist[1] == gridlist[4] &&
        gridlist[1] == gridlist[7] &&
        gridlist[1] != '') {
      _show_winner(gridlist[1]);
      filledBoxes = 0;
    }
    if (gridlist[2] == gridlist[5] &&
        gridlist[2] == gridlist[8] &&
        gridlist[2] != '') {
      _show_winner(gridlist[2]);
      filledBoxes = 0;
    }
    if (gridlist[0] == gridlist[4] &&
        gridlist[0] == gridlist[8] &&
        gridlist[0] != '') {
      _show_winner(gridlist[0]);
      filledBoxes = 0;
    }
    if (gridlist[2] == gridlist[4] &&
        gridlist[2] == gridlist[6] &&
        gridlist[2] != '') {
      _show_winner(gridlist[2]);
      filledBoxes = 0;
    }
  }

  void _clear_board() {
    setState(() {
      gridlist = ["", "", "", "", "", "", "", "", ""];
    });
  }

  bool _isDraw() {
    if (filledBoxes == 9) {
      return true;
    }
    return false;
  }

  void _show_winner(String winner) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: AlertDialog(
              backgroundColor: Colors.grey[800],
              title: Text.rich(
                TextSpan(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    TextSpan(
                        text: 'The Winner Is: ',
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                    TextSpan(
                        text: winner,
                        style: TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 255, 230, 0))),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        primary: Color.fromARGB(255, 255, 230, 0),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        _clear_board();
                        filledBoxes = 0;
                      },
                      child: Text(
                        'Play Again!',
                        style: TextStyle(color: Colors.grey[800]),
                      )),
                ),
              ],
            ),
          );
        });
    if (winner == 'o') {
      ScoreO++;
      turn = "o";
    } else {
      ScoreX++;
      turn = "x";
    }
  }

  void _showDraw() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[800],
            title: Text(
              'IT IS A DRAW',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      primary: Color.fromARGB(255, 255, 230, 0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _clear_board();
                      filledBoxes = 0;
                    },
                    child: Text(
                      'Play Again!',
                      style: TextStyle(color: Colors.grey[800]),
                    )),
              ),
            ],
          );
        });
  }
}
