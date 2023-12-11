import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const platform = MethodChannel('com.example.app/start_app');

  const MyHomePage({super.key});

  Future<void> _startApp() async {
    try {
      await platform.invokeMethod('startApp');
    } on PlatformException catch (e) {
      print("Hata: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Özel Uygulama Başlatma'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _startApp,
          child: const Text('Uygulamayı Başlat'),
        ),
      ),
    );
  }
}
