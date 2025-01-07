import 'package:flutter/material.dart';
import 'theme.dart'; // theme.dart をインポート

class CalculatorButton extends StatelessWidget {
  final String title;
  final Function(String) onPressed;

  const CalculatorButton({required this.title, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // ボタン背景色
    final Color buttonColor = buttonColors[title] ?? (isDarkMode
        ? const Color.fromARGB(255, 55, 55, 55) // ダークモード: 濃い灰色
        : const Color(0xFFF4F3F9)); // 通常モード: 明るい灰色

    // フォント設定
    final Color textColor = textColors[title] ?? (isDarkMode ? Colors.white : Colors.black);
    final double fontSize = (title == '+/-' || title == '⌫') ? 24 : 36;
    final FontWeight fontWeight = textWeights[title] ?? FontWeight.normal;

    return Container(
      width: 80,
      height: 80,
      margin: const EdgeInsets.all(3.0),
      child: ElevatedButton(
        onPressed: () => onPressed(title),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: buttonColor, // ボタン背景色
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: fontSize, color: textColor, fontWeight: fontWeight), // ボタンテキスト色
        ),
      ),
    );
  }
}
