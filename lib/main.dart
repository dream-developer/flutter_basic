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
  String _msg = ""; // テキストフィールド用
  bool _isChecked = false; // チェックボックス用
  int _radioValue = 0; // ラジオボタン用
  bool _isOn = false; // スイッチ用

  @override
  Widget build(BuildContext context) {
    // ●テキスト
    const text = Text('テキスト');

    const textArea = Column( children: [ text,], );

    // ●ボタン
    final button = ElevatedButton(
      onPressed: () { // 1
        print("ボタンが");
        print("押されました");
      },
      child: const Text("ボタン"), // 2
    );

    // ・テキストボタン
    fn(){ print("関数実行"); }

    final textbutton =TextButton(
      onPressed: fn,
      child: const Text("テキストボタン"),
    );

    final buttonArea = Row(
      children: [
        button,
        textbutton,
      ],
    );

    // ●テキストフィールド
    // String _msg = ""; ← クラスメンバにて宣言済み
    final textfieldText  = Text('メッセージ：$_msg'); // 1
    final controller = TextEditingController(); // 2

    final textfield = TextField( // 3
      controller: controller, // 4
      autofocus: true, // 5
      decoration: const InputDecoration( // 6
        border: OutlineInputBorder(),
        labelText: "内容",
        hintText: "100文字以内で入力してください",
      ),
      onChanged: (text) { // 7
        print("value: $text");
      },
    );

    setMsg() { // 1
      setState(() {
        _msg = controller.text; 
      });
    }

    clear() { controller.clear(); } // 2

    final setMsgButton = ElevatedButton( // 3
      onPressed: setMsg,
      child: const Text("反映"),
    );

    final clearButton = ElevatedButton( // 4
      onPressed: clear,
      child: const Text("クリア"),
    );

    final textfieldArea = Column(
      children: [
        textfieldText,
        textfield,
        Row( // 入れ子
          children: [
            setMsgButton,
            clearButton,
          ],
        ),
      ],
    );

    // ●チェックボックス
    // bool _isChecked = false; ← クラスメンバにて宣言済み
    final isCheckedText = Text("チェック：${_isChecked ? "オン": "オフ"}"); // 1

    final checkbox = Checkbox( // 2
      value: _isChecked,
      onChanged: (bool? value) {
        setState(() {
          _isChecked = value!;
        });
      },
    );
    
    const checkboxText = Text("チェックボックス"); 

    final checkboxArea = Row(
      children: [
        isCheckedText,
        checkbox,
        checkboxText,
      ],
    );

    // ●ラジオボタン
    // int _radioValue = 0; ← クラスメンバにて宣言済み
    final radio1 =  Radio( // 1
      value: 1, // 2
      groupValue: _radioValue, // 3
      onChanged: (value) { // 4
        setState(() {
          _radioValue = value!;
        });
      }
    );
    const radiotext1 = Text('Android');

    final radio2 =  Radio(
      value: 2,
      groupValue: _radioValue,
      onChanged: (value) {
        setState(() {
          _radioValue = value!;
        });
      }
    );
    const radiotext2 = Text('iOS');

    const radioMap = { 0: "未選択", 1: "Android", 2: "iOS", }; // 表示用
    final radioText = Text("デバイス：${radioMap[_radioValue]}");

    final radioArea = Row(
      children: [
        radio1,
        radiotext1,
        const SizedBox(width: 10.0), // スペースを開ける
        radio2,
        radiotext2,
        const SizedBox(width: 20.0), // スペースを開ける
        radioText,
      ],
    );
 
    // ●スイッチ
    // クラスメンバで bool _isOn = false;  済み
    final switchText = Text(_isOn ? "オン": "オフ"); // 1
    final toggle = Switch( // 2
      value: _isOn, // 3
      onChanged: (value) { // 4
        setState(() {
          _isOn = value;
        });
      },
    );

    final switchArea = Row(
      children: [
        switchText,
        toggle,
      ],
    );

    final body = SafeArea( // ボディー
      child: Column(
        children: [
          textArea, // テキスト関連
          buttonArea, // ボタン関連
          textfieldArea, // テキストフィールド関連
          checkboxArea, // チェックボックス関連
          radioArea, // ラジオボタン関連
          switchArea, // スイッチ関連
        ],
      ),
    );

    return Scaffold(
      body: body, // ボディー
    );
  }
}