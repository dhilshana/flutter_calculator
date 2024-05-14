// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicCalculator extends StatefulWidget {
  const BasicCalculator({super.key});

  @override
  State<BasicCalculator> createState() => _BasicCalculatorState();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  bool darkMode = false;
  String displayValue = '';
  double? firstNum;
  double? secondNum;
  String result = '';
  String operator = '';
  String inputValue = '';
  int j = 0;

  void displayString(String a) {
    setState(() {
      if (a == '⌫') {
        // If the backspace button is pressed, remove the last character from the displayValue
        if (displayValue.isNotEmpty) {
          displayValue = displayValue.substring(0, displayValue.length - 1);
        }
      } else if (a == "AC") {
        displayValue = displayValue.substring(
            0, displayValue.length - displayValue.length);
      } else {
        displayValue += a;
      }
    });
  }

  String Result(String value) {
    for (int i = 0; i < value.length; i++) {
      if (value[i] == '+' ||
          value[i] == '-' ||
          value[i] == 'x' ||
          value[i] == '/' ||
          value[i] == '%') {
        String num1 = value.substring(0, i);
        j = i;
        firstNum = double.parse(num1);
        operator = value[i];
      } else if (value[i] == '=') {
        String num2 = value.substring(j + 1, value.length - 1);
        secondNum = double.parse(num2);
        if (operator == '+') {
          result = (firstNum! + secondNum!).toString();
        } else if (operator == '-') {
          result = (firstNum! - secondNum!).toString();
        } else if (operator == 'x') {
          result = (firstNum! * secondNum!).toString();
        } else if (operator == '/') {
          result = (firstNum! / secondNum!).toString();
        } else if (operator == '%') {
          result = (firstNum! % secondNum!).toString();
        }
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkMode ? Colors.amber[50] : Colors.blueGrey[900],
        appBar: AppBar(
          leading: IconButton(
            icon: darkMode ? Icon(Icons.dark_mode_sharp) : Icon(Icons.sunny),
            color: Colors.black,
            onPressed: () {
              setState(() {
                darkMode = !darkMode;
              });
            },
          ),
          shadowColor: darkMode ? Colors.grey.shade200 : Colors.blueGrey[900],
          elevation: 10,
          toolbarHeight: 80,
          backgroundColor: Colors.amber[800],
          centerTitle: true,
          title: Text("Calculator"),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height / 4,
              child: Text(
                displayValue,
                style: TextStyle(
                    fontSize: 30,
                    color: darkMode ? Colors.black : Colors.white),
              ),
              alignment: Alignment.centerRight,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      displayString("AC");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "AC",
                        style: TextStyle(
                            fontSize: 25,
                            color: darkMode ? Colors.black : Colors.white),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      displayString('⌫');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Icon(
                        Icons.backspace_outlined,
                        color: darkMode ? Colors.black : Colors.white,
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      displayString("%");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Icon(Icons.percent,
                              color: darkMode ? Colors.black : Colors.white)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      displayString("/");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Icon(CupertinoIcons.divide,
                              color: darkMode ? Colors.black : Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      displayString("7");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "7",
                        style: TextStyle(
                            fontSize: 20,
                            color: darkMode ? Colors.black : Colors.white),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      displayString("8");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "8",
                        style: TextStyle(
                            fontSize: 20,
                            color: darkMode ? Colors.black : Colors.white),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      displayString("9");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "9",
                        style: TextStyle(
                            fontSize: 20,
                            color: darkMode ? Colors.black : Colors.white),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      displayString("x");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Icon(CupertinoIcons.multiply,
                              color: darkMode ? Colors.black : Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      displayString("4");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "4",
                        style: TextStyle(
                            fontSize: 20,
                            color: darkMode ? Colors.black : Colors.white),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      displayString("5");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "5",
                        style: TextStyle(
                            fontSize: 20,
                            color: darkMode ? Colors.black : Colors.white),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      displayString("6");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "6",
                        style: TextStyle(
                            fontSize: 20,
                            color: darkMode ? Colors.black : Colors.white),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      displayString("-");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Icon(CupertinoIcons.minus,
                              color: darkMode ? Colors.black : Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      displayString("1");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "1",
                        style: TextStyle(
                            fontSize: 20,
                            color: darkMode ? Colors.black : Colors.white),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      displayString("2");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "2",
                        style: TextStyle(
                            fontSize: 20,
                            color: darkMode ? Colors.black : Colors.white),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      displayString("3");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "3",
                        style: TextStyle(
                            fontSize: 20,
                            color: darkMode ? Colors.black : Colors.white),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      displayString("+");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Icon(CupertinoIcons.plus,
                              color: darkMode ? Colors.black : Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      displayString("0");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "0",
                        style: TextStyle(
                            fontSize: 20,
                            color: darkMode ? Colors.black : Colors.white),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      displayString(".");
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4.5,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: darkMode ? Colors.white : Colors.blueGrey[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        ".",
                        style: TextStyle(
                            fontSize: 20,
                            color: darkMode ? Colors.black : Colors.white),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      displayString("=");
                      inputValue = displayValue;
                      displayValue = Result(inputValue);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.1,
                      height: MediaQuery.of(context).size.height / 9,
                      decoration: BoxDecoration(
                          color: Colors.amber[800],
                          boxShadow: [
                            BoxShadow(
                              color: darkMode
                                  ? Color.fromARGB(255, 208, 207, 207)
                                  : Colors.grey.shade900,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 10),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Icon(CupertinoIcons.equal),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
