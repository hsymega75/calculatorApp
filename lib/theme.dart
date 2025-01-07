import 'package:flutter/material.dart';

// 通常モード（ライトモード）のテーマ
final ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white, // 背景色
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: 'NotoSansJP'),
    bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black, fontFamily: 'NotoSansJP'),
  ),
);

// ダークモードのテーマ
final ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.black, // 背景色
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: 'NotoSansJP'),
    bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white, fontFamily: 'NotoSansJP'),
  ),
);

// ボタンの背景色
final Map<String, Color> buttonColors = {
  'C': const Color(0xFFFFD7F9), // クリアボタンの背景色
  '=': const Color(0xFF95B5F7), // イコールボタンの背景色
};

// ボタンのテキスト色
final Map<String, Color> textColors = {
  'C': Colors.black, // クリアボタンのテキスト色
  '=': Colors.black, // イコールボタンのテキスト色
  '÷': const Color(0xFF95B5F7),
  '×': const Color(0xFF95B5F7),
  '-': const Color(0xFF95B5F7),
  '+': const Color(0xFF95B5F7),
  '⌫': const Color(0xFF95B5F7),
  '%': const Color(0xFF95B5F7),
  '+/-': const Color(0xFF95B5F7),
};

// ボタンの太字設定
final Map<String, FontWeight> textWeights = {
  'C': FontWeight.bold, // クリアボタンの太字設定
  '=': FontWeight.bold, // イコールボタンの太字設定
};
