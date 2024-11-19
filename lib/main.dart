import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //「services.dart」のインポート

void main() {
  final controller = TextEditingController(); // Textコントローラー
  final addTextField = TextField( // 1
    autofocus: true,
    controller: controller,
  );

  final addTextFieldFocus = Focus(
    autofocus: false, // 2
    onKeyEvent: (node, event) { 
      final key = event.logicalKey;
      if (event is KeyDownEvent) { 
        if ( key == LogicalKeyboardKey.enter ) {
          print(controller.text); // Enterキー押下で入力内容を出力
          return KeyEventResult. handled;
        }
      }
      return KeyEventResult.ignored;
    },
    child: addTextField, // 対象ウィジェットを指定
  );

  final sc = Scaffold( body: addTextFieldFocus, );
  final app = MaterialApp(home: sc);
  runApp(app);
}