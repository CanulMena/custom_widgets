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
  title: 'botones', 
  subTitle: 'varios botones en flutter', 
  link: '/botones', 
  icon: Icons.smart_button_outlined
  ),
MenuItem(
  title: 'tarjetas', 
  subTitle: 'un contenedor estilizado', 
  link: '/tarjetas', 
  icon: Icons.credit_card
  ),

];