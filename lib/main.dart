import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MethodChannelExample(),
    );
  }
}

class MethodChannelExample extends StatelessWidget {
  // Define a MethodChannel with a unique name
  static const platform = MethodChannel('com.example.flutter/native');

  Future<void> _showNativeAlert() async {
    try {
      // Call the native method 'showAlert' using the MethodChannel
      await platform.invokeMethod('showAlert');
    } on PlatformException catch (e) {
      print("Failed to show native alert: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Method Channel Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showNativeAlert,
          child: const Text('Show Native Alert'),
        ),
      ),
    );
  }
}
