import 'package:flutter/material.dart';

void main() {
  final textFormField = TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return '入力されてません';
      }
      return null;
    },
  );

  const formKey = GlobalObjectKey<FormState>('FORM_KEY');  // 1

  final form = Form(
    key: formKey, // 2
    autovalidateMode: AutovalidateMode.always,
    child: textFormField, 
  );

  final button = ElevatedButton( // 3
    onPressed: () {
      if (formKey.currentState!.validate()) { // 4
        print("バリデート通過時の処理");
      }else{
        print("バリデートエラー時の処理");
      }
    },
    child: const Text("ボタン"),
  );

  final body = Column( // ボディー
    children: [
      form, 
      button,
    ],
  );
  final sc = Scaffold( // ボディー
    body: body,
  );

  final app = MaterialApp(home: sc);
  runApp(app);
}