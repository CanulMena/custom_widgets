import 'package:custom_widgets/config/menu/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const  SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNoch = MediaQuery.of(context).viewPadding.top > 35;
    
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,//?Nos pocisionamos en el Nav..DrawerDestination dependiendo su index
      onDestinationSelected: (value) {//?Cada seleccionamos un Nav..DrawerDestination nos entrega su valor index
        navDrawerIndex = value;//? Y Agregamos su valor index al navDrawerIndex
        final menuItems = appMenuItems[value]; 
        context.push(menuItems.link);
        widget.scaffoldKey.currentState?.closeDrawer();//!Cada que presiono un navigator drawer cerrará el drawer.
        setState(() {});

      },
      children: [

        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNoch ? 35 : 30, 16, 10),
          child: const Text('Menu'),
        ),

        ...appMenuItems.sublist(0,3).
        map((menuItem) => NavigationDrawerDestination(//?Solo reconocé a los Nav..DrawerDestination
          icon: Icon(menuItem.icon), 
          label: Text(menuItem.subTitle)
          )),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
          ),

        ...appMenuItems.sublist(3).
        map((menuItem) => NavigationDrawerDestination(
          icon: Icon(menuItem.icon), 
          label: Text(menuItem.subTitle)
          )),

      ],
    );
  }
}