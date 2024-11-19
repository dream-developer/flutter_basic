import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 1

void main() {
  const text = Text('テキスト'); // 2

  final textFocus = Focus ( // 3
    autofocus: true, // 4
    onKeyEvent: (node, event) { // 5
      final key = event.logicalKey; // 6
      if (event is KeyDownEvent) { // 7
        if ( key == LogicalKeyboardKey.enter ) { // 8
          print('Enterキーが押されました'); // 9
          return KeyEventResult. handled; // 10
        }
      }
      return KeyEventResult.ignored; // 10
    },
    child: text, // 対象ウィジェットを指定
  );

  final sc = Scaffold( body: textFocus, );
  final app = MaterialApp(home: sc);
  runApp(app);
}