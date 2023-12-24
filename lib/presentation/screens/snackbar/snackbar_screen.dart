import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showSnackBar(BuildContext context ){

    ScaffoldMessenger.of(context).clearSnackBars();

     SnackBar snackbar =  SnackBar(
      content: const Text('Hola mundo'),
      duration: const Duration( seconds: 2 ),
      action: SnackBarAction(label: '!Ok', onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);

  }

void openDialog(BuildContext context) {
  showDialog( //*showDialog personalizado
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text(
            'Ex fugiat voluptate id quis aliqua nulla velit aliqua amet sunt culpa pariatur Lorem non.'),
        actions: [
          FilledButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Aceptar'),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar Screen'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () { 
                showAboutDialog(//!Este es el metodo que esta prefabricado por el equipo de flutter para poder ver las licencias
                  context: context,
                  children: [
                    const Text('Pariatur do enim esse mollit commodo anim duis occaecat non esse quis. Pariatur ex ad esse pariatur qui sint ea dolore ullamco voluptate sit. Sunt enim ad labore proident do do sit laboris proident commodo duis.')
                  ]
                  );
              },
              child: const Text('Licences used'),
            ),

            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Show dialog'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('Mostrar snackbar'),
        onPressed: () => showSnackBar(context)
        ),
    );
  }

} 