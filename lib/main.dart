import 'package:flutter/material.dart';

void main() {
  final textFormField = TextFormField( // 1
    validator: (value) { // 2
      if (value!.isEmpty) { // 3
        return '入力されてません';
      }
      return null; // 4
    },
  );

  final form = Form( // 5
    autovalidateMode: AutovalidateMode.always,
    child: textFormField, 
  );

  final body = form; // ボディー 

  final sc = Scaffold( // ボディー
    body: body,
  );

  final app = MaterialApp(home: sc);
  runApp(app);
}