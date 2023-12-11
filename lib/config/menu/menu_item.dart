import 'package:flutter/material.dart';

class MenuItem { //* Esta esta clase solo nos ayudará a controlar los MenuItems
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  MenuItem({
  required this.title, 
  required this.subTitle, 
  required this.link, 
  required this.icon
  });

  List<MenuItem> appMenuItems = [
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
  
}