import 'package:flutter/material.dart';

void main() {

  const body = Row(children: [
    Text("あいうえおかきくけこさしすせそ"),
    Text("アイウエオカキクケコサシスセソ"),
  ],);

  const body1 = Row(children: [
    Text("あいうえおかきくけこさしすせそ"),
     Flexible(
        fit: FlexFit.tight,
        // fit: FlexFit.loose,
        child: FittedBox(
          child: Text("アイウエオカキクケコサシスセソ"),
        ),
      ), 
  ],);

  const body2 = Row(children: [
    Text("あいうえおかきくけこさしすせそ"),
    SizedBox(
      width: 70,
      child: Text("アイウエオカキクケコサシスセソ"),
    ),
  ],);

  const body3 = Row(children: [
    Text("あいうえおかきくけこさしすせそ"),
    SizedBox(
      width: 70,
      child: Text( 
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        'アイウエオカキクケコサシスセソ'
    ),
    ),
  ],);

  // 対策パターンにより body1 - body3 を切り替えてください
  final sc = Scaffold( body: body,);
  // final sc = Scaffold( body: body1,);
  // final sc = Scaffold( body: body2,);
  // final sc = Scaffold( body: body3,);
  final app = MaterialApp( debugShowCheckedModeBanner: false, home: sc);
  runApp(app);
}
