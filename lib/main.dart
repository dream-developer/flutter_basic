import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget { 
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(); 
}

class _MyHomePageState extends State<MyHomePage> { 
  Future<String> _dataFetch() async { // 1
      await Future.delayed(const Duration(seconds: 1)); 
      return "データ"; 
  }

  @override
  Widget build(BuildContext context) {
    final text = FutureBuilder( // 2
        future: _dataFetch(), // 3
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) { // 4
          if (snapshot.connectionState == ConnectionState.waiting) { // 5
            return const CircularProgressIndicator();
          }

          final data = snapshot.data ?? ""; // 6

          return Text(data); // 7
        }
    );
    return Scaffold(body: text);
  }
}