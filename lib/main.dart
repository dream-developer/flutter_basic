import 'package:flutter/material.dart';

class User { // Userクラス
  final int id; // ユーザーID
  final String name; // ユーザー名
  User(this.id, this.name);
}

List<User> users = []; // User型のList 

void main() {
  for (int i = 1; i <= 50; i++) { // Listに50個分要素を追加。
    users.add(User(i, 'ユーザー$i'));
  }

  final list = ListView.builder(
    itemCount: users.length,
    itemBuilder: (c, i) => 
      ListTile( // 1
        key: Key((users[i].id).toString()), // 2
        leading: const Icon(Icons.person), // 3
        title: Text(users[i].name), // 4
        subtitle: Text("id:${users[i].id}"), // 5
        trailing: const Icon(Icons.edit), // 6
    ),
  );

  final body = Column( // ボディー
    children: [
      const Text('リストの上'), 
      Expanded( 
        child: list,
      ),
      const Text('リストの下'), 
    ],
  );

  final sc = Scaffold(
    body: body,
  );

  final app = MaterialApp(home: sc);
  runApp(app);
}