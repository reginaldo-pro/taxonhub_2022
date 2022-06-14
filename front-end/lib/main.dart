import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taxon Hub'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Hello World!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
