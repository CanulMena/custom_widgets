import 'package:custom_widgets/config/router/app_router.dart';
import 'package:custom_widgets/presentation/providers/theme_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp()
      )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appTheme = ref.watch(themeNotifierProvider);

    return  MaterialApp.router(
      title: 'learing widgets',
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
      routerConfig: router,
    );
  }
}
