import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String display = '';
  var sign = '';
  bool noOperator = true;

  compute() {
    for (var x = 0; x < display.length; x++) {
      if (display[x].contains((RegExp('[0-9]')))) {
        continue;
      } else {
        sign += display[x];
      }
    }
    switch (sign) {
      case '+':
        var plus = display.split('+');
        display = (int.parse(plus[0]) + int.parse(plus[1])).toString();
        break;
      case '-':
        var minus = display.split('-');
        display = (int.parse(minus[0]) - int.parse(minus[1])).toString();
        break;
      case '/':
        var divide = display.split('/');
        display = (int.parse(divide[0]) / int.parse(divide[1])).toString();
        break;
      case '*':
        var times = display.split('*');
        display = (int.parse(times[0]) * int.parse(times[1])).toString();
        break;
    }
    sign = '';
  }

  checkToCompute() {
    // CHECKS IF THE LAST INDEX OF THE DISPLAY IS AN OPERATOR OR NOT AND CHECKS IF THERE IS AN OPERATOR IN BETWEEN DIGITS TO COMPUTE
    if (display[display.length - 1].contains(RegExp('[0-9]'))) {
      // CHECKS IF LAST STRING ON DISPLAY IS A NUMBER OR AN OPERATOR
      noOperator = true; // RE-ASSIGNS TRUE TO BOOLEAN TYPE
      for (var x = 0; x < display.length; x++) {
        // CHECKS IF THERE EXIST AN OPERATOR IN BETWEEN NUMBERS
        if (display[x].contains(RegExp('[0-9]'))) {
          continue;
        } else {
          compute(); // COMPUTES, IF THERE EXIST AN OPERATOR
        }
      }
    } else {
      return noOperator = false; // ELSE, ASSIGNS FALSE TO BOOLEAN TYPE
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('CALCULATOR'),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
              child: Container(
                color: Colors.transparent,
                child: Column(children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(display,
                      style: const TextStyle(
                        fontSize: 50.0,
                      )),
                  const Divider(
                    height: 75.0,
                    color: Colors.green,
                    thickness: 1.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                display = '';
                              });
                            },
                            color: Colors.black,
                            child: const Text('A C',
                                style: TextStyle(
                                    fontSize: 40.0, color: Colors.white)),
                          )),
                      const SizedBox(
                        width: 50.0,
                      ),
                      Expanded(
                          flex: 1,
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                display =
                                    display.substring(0, display.length - 1);
                              });
                            },
                            color: Colors.red,
                            child: const Text('DEL',
                                style: TextStyle(
                                    fontSize: 40.0, color: Colors.white)),
                          ))
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  Row(
                    children: [
                      Expanded(
                          child: FlatButton(
                        onPressed: () {
                          setState(() {
                            display += '1';
                          });
                        },
                        child: const Text(
                          '1',
                          style: TextStyle(fontSize: 40.0),
                        ),
                      )),
                      Expanded(
                          child: FlatButton(
                        onPressed: () {
                          setState(() {
                            display += '2';
                          });
                        },
                        child:
                            const Text('2', style: TextStyle(fontSize: 40.0)),
                      )),
                      Expanded(
                          child: FlatButton(
                        onPressed: () {
                          setState(() {
                            display += '3';
                          });
                        },
                        child:
                            const Text('3', style: TextStyle(fontSize: 40.0)),
                      ))
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  Row(
                    children: [
                      Expanded(
                          child: FlatButton(
                        onPressed: () {
                          setState(() {
                            display += '4';
                          });
                        },
                        child:
                            const Text('4', style: TextStyle(fontSize: 40.0)),
                      )),
                      Expanded(
                          child: FlatButton(
                        onPressed: () {
                          setState(() {
                            display += '5';
                          });
                        },
                        child:
                            const Text('5', style: TextStyle(fontSize: 40.0)),
                      )),
                      Expanded(
                          child: FlatButton(
                        onPressed: () {
                          setState(() {
                            display += '6';
                          });
                        },
                        child:
                            const Text('6', style: TextStyle(fontSize: 40.0)),
                      ))
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  Row(
                    children: [
                      Expanded(
                          child: FlatButton(
                        onPressed: () {
                          setState(() {
                            display += '7';
                          });
                        },
                        child:
                            const Text('7', style: TextStyle(fontSize: 40.0)),
                      )),
                      Expanded(
                          child: FlatButton(
                        onPressed: () {
                          setState(() {
                            display += '8';
                          });
                        },
                        child:
                            const Text('8', style: TextStyle(fontSize: 40.0)),
                      )),
                      Expanded(
                          child: FlatButton(
                        onPressed: () {
                          setState(() {
                            display += '9';
                          });
                        },
                        child:
                            const Text('9', style: TextStyle(fontSize: 40.0)),
                      ))
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  Row(
                    children: [
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              checkToCompute();
                              if (noOperator == true) {
                                display += '+';
                              } else {
                                return;
                              }
                            });
                          },
                          child:
                              const Text('+', style: TextStyle(fontSize: 40.0)),
                        ),
                      ),
                      Expanded(
                          child: FlatButton(
                        onPressed: () {
                          setState(() {
                            display += '0';
                          });
                        },
                        child:
                            const Text('0', style: TextStyle(fontSize: 40.0)),
                      )),
                      Expanded(
                          child: FlatButton(
                        onPressed: () {
                          setState(() {
                            checkToCompute();
                            if (noOperator == true) {
                              display += '-';
                            } else {
                              return;
                            }
                          });
                        },
                        child:
                            const Text('-', style: TextStyle(fontSize: 40.0)),
                      ))
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  Row(
                    children: [
                      Expanded(
                          child: FlatButton(
                        onPressed: () {
                          setState(() {
                            checkToCompute();
                            if (noOperator == true) {
                              display += '/';
                            } else {
                              return;
                            }
                          });
                        },
                        child:
                            const Text('/', style: TextStyle(fontSize: 40.0)),
                      )),
                      Expanded(
                          child: FlatButton(
                        onPressed: () {
                          setState(() {
                            checkToCompute();
                            if (noOperator == true) {
                              display += '*';
                            } else {
                              return;
                            }
                          });
                        },
                        child:
                            const Text('X', style: TextStyle(fontSize: 40.0)),
                      )),
                      Expanded(
                          child: FlatButton(
                        onPressed: () {
                          setState(() {
                            compute();
                          });
                        },
                        color: Colors.red,
                        child:
                            const Text('=', style: TextStyle(fontSize: 40.0)),
                      ))
                    ],
                  ),
                ]),
              ),
            )));
  }
}
