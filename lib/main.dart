import 'package:custom_widgets/config/router/app_router.dart';
import 'package:custom_widgets/config/themes/theme_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      title: 'learing widgets',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 1).getTheme(),
      routerConfig: router,
    );
  }
}
