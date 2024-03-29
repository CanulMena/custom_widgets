import 'package:custom_widgets/presentation/providers/theme_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Theme'),
        actions: [
          IconButton(
            onPressed: (){
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
            icon: ref.watch(themeNotifierProvider).isDarkMode ? const Icon(Icons.dark_mode_outlined) : const Icon(Icons.light_mode_outlined)
            )
        ],
      ),

      body: const _ThemeChangedView(),

    );
  }
}

class _ThemeChangedView extends ConsumerWidget {
  const _ThemeChangedView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
          //*Con esta declaracion obtenemos: colorList
    // final List<Color> colors = ref.watch(listProvider);
    // final int? selectedColor = ref.watch(selectedColorProvider);
    final List<Color> colors = ref.watch(themeNotifierProvider.notifier).colorListP;

    return ListView.builder(   
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color),),
          subtitle: Text('${color.value}'),
          value: index, 
          groupValue: ref.watch(themeNotifierProvider).selectedColor , /* nos indica en que pocision esta */
          onChanged: (value /* aca tengo el valor del index */ ) {
            // ref.read(selectedColorProvider.notifier).update((state) => index);
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);

          },

          );
      },
      );
  }
}