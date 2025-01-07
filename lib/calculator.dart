import 'package:flutter/material.dart';
import 'calculator_logic.dart'; // 計算用
import 'calculator_button.dart'; // ボタン

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = "0"; // 計算内容
  String history = ""; // 計算履歴
  bool isNewInput = true; // 新規入力か判定

  final CalculatorLogic logic = CalculatorLogic();

  final _buttonRows = [
    ['+/-', '⌫', '%', '÷'],
    ['7', '8', '9', '×'],
    ['4', '5', '6', '-'],
    ['1', '2', '3', '+'],
    ['C', '0', '.', '=']
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  history, // 履歴を表示
                  style: TextStyle(
                    fontSize: 24,
                    color: isDarkMode ? Colors.grey : Colors.black54,
                  ),
                ),
                Text(
                  display, // 現在の入力内容を表示
                  style: TextStyle(
                    fontSize: 48,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
    for (int i = 0; i < _buttonRows.length; i++) buildButtonRow(_buttonRows[i]),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget buildButtonRow(List<String> titles) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: titles.map((title) {
        return CalculatorButton(title: title, onPressed: onButtonPressed);
      }).toList(),
    );
  }

  void onButtonPressed(String value) {
    setState(() {
      switch (value) {
        case 'C':
          display = "0";
          history = "";
          logic.reset();
          isNewInput = true;
          break;

        case '⌫':
          if (display.length > 1) {
            display = display.substring(0, display.length - 1);
          } else {
            display = "0";
          }
          break;

        case '+':
        case '-':
        case '×':
        case '÷':
          if (!isNewInput) {
            display = logic.calculate(display); // 計算結果を取得
          }
          logic.setFirstValue(display);
          logic.setOperation(value);
          history = "$display $value";
          isNewInput = true;
          break;

        case '=':
          if (!isNewInput) {
            history = "$history $display =";
            display = logic.calculate(display); // 計算結果を取得
          }
          logic.reset();
          isNewInput = true;
          break;

        case '.':
          if (!display.contains('.')) {
            display += '.';
          }
          break;

        case '+/-':
          if (display != '0') {
            if (display.startsWith('-')) {
              display = display.substring(1);
            } else {
              display = '-$display';
            }
          }
          break;

        case '%':
          double currentValue = double.tryParse(display) ?? 0.0;
          display = (currentValue / 100).toString();
          isNewInput = true;
          break;

        default:
          if ('0123456789'.contains(value)) {
            if (isNewInput || display == "0") {
              display = value;
              isNewInput = false;
            } else {
              display += value;
            }
          }
          break;
      }
    });
  }
}