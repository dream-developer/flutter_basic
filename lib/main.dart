import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // 1

Future<void> myLaunchUrl(Uri uri) async { // 2
  if (!await launchUrl(uri)) {
    throw Exception('URIの起動が出来ません $uri');
  }
}

void main() {
  final uriHttp = Uri.parse('http://example.com');// 3
  final uriMailto = Uri.parse('mailto:test@example.com?subject=件名&body=本文'); 
  final uriTel = Uri.parse('tel:+00-00-0000-0000');
  final uriSms = Uri.parse('sms:000-0000-0000');

  final buttonHttp = ElevatedButton( // 4
    onPressed: () { myLaunchUrl(uriHttp); },
    child: const Text("Webアクセス"),
  );
  final buttonMailto = ElevatedButton(
    onPressed: () { myLaunchUrl(uriMailto); },
    child: const Text("メール"),
  );
  final buttonTel = ElevatedButton(
    onPressed: () { myLaunchUrl(uriTel); },
    child: const Text("電話"),
  );
  final buttonSms = ElevatedButton(
    onPressed: () { myLaunchUrl(uriSms); },
    child: const Text("SMS"),
  );

  final body = SafeArea( // 5
      child: Column(
      children: [ buttonHttp, buttonMailto, buttonTel, buttonSms, ],
    ),
  );

  final sc = Scaffold(
    body: body,
  );

  final app = MaterialApp(home: sc);
  runApp(app);
}