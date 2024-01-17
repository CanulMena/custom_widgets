import 'package:custom_widgets/presentation/providers/counter_screen_provider.dart';
import 'package:custom_widgets/presentation/providers/theme_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
                            //?Quiere decir que puedo usar cualquier provider y no nos importa donde este
class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //?Estams utilizando este provider sin importar su ubicacion como por ejemplo: context.whatch<CounterProvider>();
    //!Simplificamos este proceso dividiendo a cada provider en un solo estado
    // final int clickCounter = ref.watch(counterProvider);
    //?El whatch es para que el provider pueda saber si la informacion del clickCounter estará cambiando

    // final isDarkMode = ref.watch(isDarkModeProvider);
    
    return Scaffold(  

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back)
          ),

        actions: [
          IconButton(
            onPressed: (){
              //*En las funcinoes solo se agrega el ref.red()
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
            icon:  ref.watch(isDarkModeProvider) ? const Icon(Icons.dark_mode_outlined) : const Icon(Icons.light_mode_outlined)
            )
        ],

        title: const Text('Counter Screen'),

      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Valor: ${ref.watch(counterProvider)}',
              style: Theme.of(context).textTheme.titleLarge
              )
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FilledButton(
            child: const Icon(Icons.plus_one),
            onPressed: () {
              ref.read(counterProvider.notifier).state++;
            }
          ),

          const SizedBox(height: 20,),

          FilledButton(
            child: const Icon(Icons.exposure_minus_1_outlined),
            onPressed: () {
              ref.read(counterProvider.notifier).state--; 
            }
          ),
        ],
      ),
      
    );
  }
}