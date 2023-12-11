import 'package:custom_widgets/config/themes/theme_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 1).getTheme(),
      home: Scaffold(
        body: Center(
          child: FilledButton(onPressed: () {}, child: const Text('Hola mundo')),
        ),
      ),
    );
  }
}
