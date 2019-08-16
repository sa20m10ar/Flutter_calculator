import 'package:flutter/material.dart';

void main() => runApp(MyCalculator());

class MyCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Calculator();
  }
}

class _Calculator extends State<Calculator> {
  String text = '0';
  double numOne = 0;

  double numTwo = 0;
  String result = '0';
  String finalResult = '0';

  String opr = '';
  String preOpr = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                    ),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button('c', Color(0xffa5a5a5), 1),
                button('+/-', Color(0xffa5a5a5), 1),
                button('%', Color(0xffa5a5a5), 1),
                button('/', Color(0xffff9800), 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button('7', Color(0xff323232), 1),
                button('8', Color(0xff323232), 1),
                button('9', Color(0xff323232), 1),
                button('x', Color(0xffff9800), 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button('4', Color(0xff323232), 1),
                button('5', Color(0xff323232), 1),
                button('6', Color(0xff323232), 1),
                button('-', Color(0xffff9800), 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button('1', Color(0xff323232), 1),
                button('2', Color(0xff323232), 1),
                button('3', Color(0xff323232), 1),
                button('+', Color(0xffff9800), 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                button('0', Color(0xff323232), 0),
                button('.', Color(0xff323232), 1),
                button('=', Color(0xffff9800), 1),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget button(String btnText, Color color, int num) {
    Container container;
    if (num == 0) {
      container = Container(
        padding: EdgeInsets.all(5.0),
        child: RaisedButton(
          onPressed: () {
            calculate(btnText);
          },
          child: Text(
            btnText,
            style: TextStyle(fontSize: 40.0, color: Colors.black),
          ),
          color: color,
          shape: StadiumBorder(),
          padding: EdgeInsets.only(left: 80, right: 80, top: 18, bottom: 18),
        ),
      );
    } else {
      container = Container(
        padding: EdgeInsets.all(5.0),
        child: RaisedButton(
          onPressed: () {
            calculate(btnText);
          },
          child: Text(
            btnText,
            style: TextStyle(fontSize: 40.0, color: Colors.black),
          ),
          color: color,
          shape: CircleBorder(),
          padding: EdgeInsets.all(20.0),
        ),
      );
    }

    return container;
  }

  void calculate(btnText) {
    if (btnText == 'c') {
      text = '0';
      numOne = 0;

      numTwo = 0;
      result = '0';
      finalResult = '0';

      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      switch (preOpr) {
        case '+':
          finalResult = add();
          break;
        case '-':
          finalResult = sub();
          break;
        case 'x':
          finalResult = mul();
          break;
        case '/':
          finalResult = div();
          break;
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }
      switch (opr) {
        case '+':
          finalResult = add();
          break;
        case '-':
          finalResult = sub();
          break;
        case 'x':
          finalResult = mul();
          break;
        case '/':
          finalResult = div();
          break;
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = (numOne / 100).toString();
      finalResult = result;
    } else if (btnText == '.') {
      if (!result.contains('.')) result += '.';
      finalResult = result;
    } else if (btnText == '+/-') {
      result.startsWith('-')
          ? result = result.substring(1)
          : result = '-' + result;
      finalResult = result;
    } else {
      if (result == '0')
        result = btnText;
      else
        result = result + btnText;
      finalResult = result;
    }
    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return result;
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return result;
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return result;
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return result;
  }
}
