import 'package:flutter/material.dart';

Stream<String> myStream() async* { // 1
  for (int i = 1; i <= 10; i++) { // 2
    await Future.delayed(const Duration(seconds: 1)); // 3
    yield "データ"; // 4
  }
}

void main() {
  final button = ElevatedButton( 
    onPressed: () async { // 5
      await for (final data in myStream()) { // 6
        print(data);
      }
    },
    child: const Text("ボタン"),
  );

  final sc = Scaffold(body: button);
  final app = MaterialApp(home: sc);
  runApp(app);
}