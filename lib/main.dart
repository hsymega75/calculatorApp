import 'package:flutter/material.dart';
import 'calculator.dart';
import 'theme.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  ThemeMode _themeMode = ThemeMode.light; // デフォルトはライトモード

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme, // ライトモードのテーマ
      darkTheme: darkTheme, // ダークモードのテーマ
      themeMode: _themeMode, // 現在のテーマモード
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                _themeMode == ThemeMode.dark ? Icons.wb_sunny : Icons.nightlight_round,
                color: _themeMode == ThemeMode.dark ? Colors.yellow : Colors.black, // アイコン色
              ),
              onPressed: () {
                setState(() {
                  _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
                });
              },
            ),
          ],
        ),
        body: const Calculator(), // 電卓表示
      ),
    );
  }
}
