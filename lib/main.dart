import 'package:flutter/material.dart';

void main() {
  // SafeAreaなし
  const body = Text("テキスト");
  // SafeAreaあり
  // const body = SafeArea( 
  //   child: Text("テキスト"),
  // );

  const sc = Scaffold(
    body: body,
  );

  const app = MaterialApp(home: sc);
  runApp(app);
}