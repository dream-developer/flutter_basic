import 'package:flutter/material.dart';

Future<String> dataFetch() async { // 1
    await Future.delayed(const Duration(seconds: 1)); // 2
    return "データ"; // 3
}

void main() {
  final button = ElevatedButton( 
    onPressed: () async{ // 4
      final data = await dataFetch();
      print(data); // 5
    },
    child: const Text("ボタン"),
  );

  final sc = Scaffold(body: button);
  final app = MaterialApp(home: sc);
  runApp(app);
}