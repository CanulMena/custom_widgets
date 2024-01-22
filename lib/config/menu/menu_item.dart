import 'package:flutter/material.dart';

class MenuItem {
  //* Esta esta clase solo nos ayudará a controlar los MenuItems
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

//!Al no estar dentro de una clase podemos acceder a esta variable con el simple echo de importar el enlace de este documento(codigo)
const List<MenuItem> appMenuItems = [
  MenuItem(
      title: 'Botones',
      subTitle: 'varios botones en flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'ProgressIndicator',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars y dialogos',
      subTitle: 'Indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.info_outline_rounded),
  MenuItem(
      title: 'Animated container',
      subTitle: 'stateful widget animated',
      link: '/animateds',
      icon: Icons.check_box),
  MenuItem(
      title: 'UI Controlls + Tiles',
      subTitle: 'Una serie de controles en flutter',
      link: '/ui-controls',
      icon: Icons.abc_rounded),
  MenuItem(
      title: 'Introduccion aplicaction',
      subTitle: 'short tutorial',
      link: '/tutorials',
      icon: Icons.thunderstorm_outlined),
  MenuItem(
      title: 'Infinitescroll and Pull',
      subTitle: 'infinite lists and pull to refresh',
      link: '/infinite',
      icon: Icons.medical_information_outlined),
  MenuItem(
      title: 'Riverpod counter',
      subTitle: 'Introduccion to riverpod',
      link: '/counter',
      icon: Icons.plus_one),
  MenuItem(
      title: 'Change Theme',
      subTitle: 'Theme change of the aplication',
      link: '/changer-theme',
      icon: Icons.change_circle),
  MenuItem(
      title: 'Change color blocks',
      subTitle: 'we will change the color with keys',
      link: '/changer-block-color',
      icon: Icons.change_circle_sharp),
  MenuItem(
      title: 'scroll and animate a box',
      subTitle: 'i will try this xd',
      link: '/scroll-animated-box',
      icon: Icons.add_box),
];
