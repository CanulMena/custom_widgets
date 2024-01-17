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
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
  );

class ThemeNotifier extends StateNotifier<AppTheme>{
  //*Literalmente estoy creando una instancia de la clase AppTheme()
  // STATE = Estado = new AppTheme();
  // Dentro del constructor del StateNotifierProvider nos pide crear una instacia es por eso que en super agregamos la instancia que queremos modificar
  ThemeNotifier() : super( AppTheme() );

  final List<Color> colorListP = colorList;


  void toggleDarkMode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex( int index){
    state = state.copyWith(selectedColor: index);
    
  }

}










/*
!Tutorial de como obtener los datos del stateProvider y solo del valor que esta regresando el stateProvider
*Si solo quiero tener el valor false del isDarkModeProvider la declaracion sería algo tal que así.
? final bool isDarkMode = ref.watch(isDarkModeProvider); con esto obtendríamos el valor del false
*Pero si queremos cambiar el valor del false. Podemo obtener el StateProvider<bool>((ref) => false
*Para que de esa manera estemos modificacion el valor que esta regresando el StateProvider<bool>((ref) => false
? ref.red(isDarkModeProvider.notifier).update((state) => !state); De esta manera modificacom el valor que regresa ese StateProvider
**/

/*
*El super esta relacionado con el constructor de la clase que se esta heredando 

existen formas de utilizar el super.
al usar extend - usar una herencia estamos pasando todos sus metodos a la clase que le estamos haciendo el extend
por lo tanto nos permite usar sus metodos al invocar la palabra super. 

Pero tambien podemos heredar el constructor de la clase a la clase que le queremos heredar, utilizamos super(). Nos indica que podemos heredar su constructor

**/