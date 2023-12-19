import 'package:flutter/material.dart';

class MenuItem { //* Esta esta clase solo nos ayudará a controlar los MenuItems
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
  required this.title, 
  required this.subTitle, 
  required this.link, 
  required this.icon
  });
}

//!Al no estar dentro de una clase podemos acceder a esta variable con el simple echo de importar el enlace de este documento(codigo)
const List<MenuItem> appMenuItems =[
  
MenuItem(
  title: 'Botones', 
  subTitle: 'varios botones en flutter', 
  link: '/buttons', 
  icon: Icons.smart_button_outlined
  ),
MenuItem(
  title: 'Tarjetas', 
  subTitle: 'un contenedor estilizado', 
  link: '/cards', 
  icon: Icons.credit_card
  ),
MenuItem(
  title: 'ProgressIndicator', 
  subTitle: 'Generales y controlados', 
  link: '/progress', 
  icon: Icons.refresh_rounded
  ),

];