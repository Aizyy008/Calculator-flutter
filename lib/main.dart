import 'package:flutter/material.dart';
import 'package:calculator/components/my_button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(top: 0, right: 40),
                  child: Text(
                    userInput.toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(bottom: 100, right: 40),
                  child: Text(
                    answer.toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    child:  Padding(
                      padding: EdgeInsets.only(left: 12, bottom:10,),
                      child: FloatingActionButton(
                        onPressed: () {
                          userInput = '';
                          answer = '';
                          setState(() {});
                        },
                        child: Text(
                          "AC",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        backgroundColor: Colors.grey,
                        shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                    width: 194,
                    height: 70,
                  ),

                  MyButton('%', Colors.grey, Colors.white, onPress: () {
                    userInput += '*0.01';
                    setState(() {});
                  }),
                  MyButton('/', Colors.orange, Colors.white, onPress: () {
                    userInput += '/';
                    setState(() {});
                  }),
                ],
              ),
              Row(
                children: [
                  MyButton('7', Colors.grey, Colors.white, onPress: () {
                    userInput += '7';
                    setState(() {});
                  }),
                  MyButton('8', Colors.grey, Colors.white, onPress: () {
                    userInput += '8';
                    setState(() {});
                  }),
                  MyButton('9', Colors.grey, Colors.white, onPress: () {
                    userInput += '9';
                    setState(() {});
                  }),
                  MyButton('x', Colors.orange, Colors.white, onPress: () {
                    userInput += '*';
                    setState(() {});
                  }),
                ],
              ),
              Row(
                children: [
                  MyButton('4', Colors.grey, Colors.white, onPress: () {
                    userInput += '4';
                    setState(() {});
                  }),
                  MyButton('5', Colors.grey, Colors.white, onPress: () {
                    userInput += '5';
                    setState(() {});
                  }),
                  MyButton('6', Colors.grey, Colors.white, onPress: () {
                    userInput += '6';
                    setState(() {});
                  }),
                  MyButton(
                    '-',
                    Colors.orange,
                    Colors.white,
                    onPress: () {
                      userInput += '-';
                      setState(() {});
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  MyButton('1', Colors.grey, Colors.white, onPress: () {
                    userInput += '1';
                    setState(() {});
                  }),
                  MyButton('2', Colors.grey, Colors.white, onPress: () {
                    userInput += '2';
                    setState(() {});
                  }),
                  MyButton('3', Colors.grey, Colors.white, onPress: () {
                    userInput += '3';
                    setState(() {});
                  }),
                  MyButton('+', Colors.orange, Colors.white, onPress: () {
                    userInput += '+';
                    setState(() {});
                  }),
                ],
              ),
              Row(
                children: [
                  MyButton('0 ', Colors.grey, Colors.white, onPress: () {
                    userInput += '0';
                    setState(() {});
                  }),
                  MyButton('.', Colors.grey, Colors.white, onPress: () {
                    userInput += '.';
                    setState(() {});
                  }),
                  MyButton('DEL', Colors.grey, Colors.white, onPress: () {
                    userInput = userInput.substring(0, userInput.length - 1);
                    setState(() {});
                  }),
                  MyButton('=', Colors.orange, Colors.white, onPress: () {
                    print("User Input: " + userInput);
                    equalPress();
                    setState(() {});
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    double eval;

    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();
    if (userInput.contains(".") || userInput.contains("/")) {
      eval = expression.evaluate(EvaluationType.REAL, contextModel);
      answer = eval.toString();
    }
//       else if(userInput.contains(' + + ') || userInput.contains(' + - ') || userInput.contains(' + * ') || userInput.contains(' + / ') || userInput.contains(' + % ') || userInput.contains(' - - ') || userInput.contains(' - + ') || userInput.contains(' - * ') || userInput.contains(' - / ') || userInput.contains(' - % ') || userInput.contains(' * * ')
//           || userInput.contains('*+') || userInput.contains('*-') || userInput.contains('*/') || userInput.contains('*%')
//           || userInput.contains('//') || userInput.contains('/+') || userInput.contains('/-') || userInput.contains('/*') || userInput.contains('/%') || userInput.contains('%%') || userInput.contains('%+') || userInput.contains('%-') || userInput.contains('%*') || userInput.contains('%/')){
// answer = "Error";
//       }
    else if (userInput.contains('+') ||
        userInput.contains('-') ||
        userInput.contains('*')) {
      double eval1 = expression.evaluate(EvaluationType.REAL, contextModel);
      int eval2 = eval1.toInt();
      answer = eval2.toString();
    } else {
      bool hasError = false;
      List<String> operators = ["+", "-", "*", "/", "%"];
      for (int i = 0; i < userInput.length - 1; i++) {
        String char1 = userInput[i];
        String char2 = userInput[i + 1];
        if (operators.contains(char1) && operators.contains(char2)) {
          answer = "Error";
          hasError = true;
          break;
        }
      }
    }
  }
}
