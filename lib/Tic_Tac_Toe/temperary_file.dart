import 'package:flutter/material.dart';
import 'global.dart';

class TicTacToeFirstPage extends StatefulWidget {
  const TicTacToeFirstPage({super.key});

  @override
  State<TicTacToeFirstPage> createState() => _TicTacToeFirstPageState();
}

class _TicTacToeFirstPageState extends State<TicTacToeFirstPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 8,
                  children: List.generate(
                    9,
                        (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            if (storeOX[index] == '') {
                              storeOX[index] = (x % 2 == 0) ? "O" : "X";
                              store.add(index);
                              if (checkTie == true) {
                                storeOX[index] = '';
                              }
                              if (checkWin(storeOX, storeOX[index])) {
                                winMsg = 'Player ${storeOX[index]} is Winner';
                                // buildTimer(1);
                                checkTie = true;
                              } else {
                                (check < 9) ? check++ : check = 9;
                                if (check == 9) {
                                  tieMsg = 'Game is Tie';
                                  // buildTimer(2);
                                }
                              }
                              x++;
                            } else {
                              var snackBar = SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.grey.shade900,
                                elevation: 0,
                                content: const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Text(
                                    'Position Allready Taken, Not Valid!!',
                                    style: TextStyle(
                                        fontFamily: 'Poppins', fontSize: 15),
                                  ),
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          });
                        },
                        child: buildContainer(width, storeOX[index], index)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  (checkTie) ? winMsg : tieMsg,
                  style: const TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () {
                        setState(() {
                          c1 = -1;
                          c2 = -1;
                          c3 = -1;
                          winMsg = '';
                          tieMsg = '';
                          if (!checkTie) {
                            (check > 0) ? check -= 1 : check = 0;
                          }
                          checkTie = false;
                          x++;
                          for (int i = store.length - 1; i >= 0; i--) {
                            if (storeOX[store[i]] != '') {
                              storeOX[store[i]] = '';
                              break;
                            }
                          }
                        });
                      },
                      child: const Text(
                        'Undo',
                        style: TextStyle(color: Colors.teal, fontSize: 22),
                      ),
                    ),
                    FilledButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () {
                        setState(() {
                          winMsg = '';
                          tieMsg = '';
                          checkTie = false;
                          check = 0;
                          x = 0;
                          c1 = -1;
                          c2 = -1;
                          c3 = -1;
                          storeOX = List.generate(9, (index) => '');
                        });
                      },
                      child: const Text(
                        'Reset',
                        style: TextStyle(color: Colors.teal, fontSize: 22),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
// Timer buildTimer(int n) {
//   return Timer(const Duration(seconds: 3), () {
//     setState(() {
//       (n == 1) ? winMsg = '' : tieMsg = '';
//       checkTie = false;
//       check = 0;
//       x = 0;
//     });
//   });
// }
}
