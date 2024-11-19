import 'package:flutter/material.dart';

void main() {
  List<Text> texts = []; // 1

  for (int i = 1; i <= 50; i++) { // 2
    texts.add(Text('テキスト$i'));
  }
    
  final list = ListView.builder( // 3
    itemCount: texts.length, // 4
    itemBuilder: (c, i) => texts[i], // 5
  );

  final body = Column( // ボディー
    children: [
      const Text('リストの上'), // 6．
      Expanded( // 7．
        child: list,
      ),
      const Text('リストの下'), // 6．
    ],
  );

  final sc = Scaffold(
    body: body,
  );

  final app = MaterialApp(home: sc);
  runApp(app);
}