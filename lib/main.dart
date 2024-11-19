import 'package:flutter/material.dart';

import 'env.dart'; // 1

void main() {
  final apikey = Env.apikey; // 2

  final body = SafeArea( 
    child: Text("APIキー：$apikey"), // 3
  );

  final sc = Scaffold( body: body);
  final app = MaterialApp(home: sc);
  runApp(app);
}