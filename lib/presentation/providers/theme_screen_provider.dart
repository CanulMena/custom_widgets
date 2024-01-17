import 'package:custom_widgets/config/themes/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//* Utilizamos provider para valores inmutables ( const )
final listProvider = Provider<List<Color>>((ref) => colorList);
//*Utilizamos state para mantener una pieza de estado. En este caso si queremos modificar el valor del false.
final isDarkModeProvider = StateProvider<bool>((ref) => false);

final selectedColorProvider = StateProvider<int>((ref) => 0);

//*Cuando el estado es un poco mas elaborado podemos usar StateNotifierProvider. Aquí el ejemplo:
//Un objeto / instancia de tipo AppTheme ( custom )
// final themeNotifierProvider = StateNotifierProvider<AppTheme>((ref) => null);

// class ThemeNotifier extends StateNotifier{
//   //*Literalmente estoy creando una instancia de la clase AppTheme()
//   // STATE = Estado = new AppTheme();
//   ThemeNotifier() : super( AppTheme() );



// }










/*
!Tutorial de como obtener los datos del stateProvider y solo del valor que esta regresando el stateProvider
*Si solo quiero tener el valor false del isDarkModeProvider la declaracion sería algo tal que así.
? final bool isDarkMode = ref.watch(isDarkModeProvider); con esto obtendríamos el valor del false
*Pero si queremos cambiar el valor del false. Podemo obtener el StateProvider<bool>((ref) => false
*Para que de esa manera estemos modificacion el valor que esta regresando el StateProvider<bool>((ref) => false
? ref.red(isDarkModeProvider.notifier).state.update((state) => !state); De esta manera modificacom el valor que regresa ese StateProvider
**/