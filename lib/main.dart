import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => __MyHomePageState();
}

class __MyHomePageState extends State<MyHomePage> {
  String output = '0';

  String Value = '0';
  double one = 0;
  double two = 0;
  String operator = "";
  String history = "";

  Widget createButton(String buttonValue, int flexValue) {
    return Expanded(
      flex: flexValue,
      child: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          onPressed: () {
            setState(() {
              if (buttonValue == 'C') {
                Value = '0';
                one = 0;
                two = 0;
                operator = "";
              } else if (buttonValue == '+' ||
                  buttonValue == '-' ||
                  buttonValue == 'x' ||
                  buttonValue == '/' ||
                  buttonValue == '%') {
                one = double.parse(output);
                operator = buttonValue;
                Value = '0';
              } else if (buttonValue == '.') {
                Value = Value + buttonValue;
              } else if (buttonValue == "=") {
                two = double.parse(output);

                if (operator == '+') {
                  Value = (one + two).toString();
                } else if (operator == '-') {
                  Value = (one - two).toString();
                } else if (operator == 'x') {
                  Value = (one * two).toString();
                } else if (operator == '/') {
                  Value = (one / two).toString();
                } else if (operator == '%') {
                  Value = (one % two).toString();
                }

                one = 0;
                two = 0;
                operator = "";
              } else {
                Value = Value + buttonValue;
              }
              setState(() {
                output = double.parse(Value).toStringAsFixed(2);
              });

              if (buttonValue != 'C') {
                history = history + buttonValue;
              } else {
                history = '';
              }
            });
          },
          child: Container(
            child: Text(
              buttonValue,
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            padding: EdgeInsets.all(15),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Divider(),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.5),
                child: Text(
                  history,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(12.5, 12.5, 12.5, 25),
                child: Text(
                  output,
                  style: TextStyle(
                    fontSize: 75,
                    color: Colors.black87,
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      createButton("C", 2),
                      createButton("/", 2),
                    ],
                  ),
                  Row(
                    children: [
                      createButton("7", 1),
                      createButton("8", 1),
                      createButton("9", 1),
                      createButton("x", 1),
                    ],
                  ),
                  Row(
                    children: [
                      createButton("4", 1),
                      createButton("5", 1),
                      createButton("6", 1),
                      createButton("+", 1),
                    ],
                  ),
                  Row(
                    children: [
                      createButton("1", 1),
                      createButton("2", 1),
                      createButton("3", 1),
                      createButton("-", 1),
                    ],
                  ),
                  Row(
                    children: [
                      createButton("0", 1),
                      createButton("%", 1),
                      createButton("=", 2),
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
