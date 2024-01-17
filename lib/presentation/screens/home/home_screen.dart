import 'package:custom_widgets/config/menu/menu_item.dart';
import 'package:custom_widgets/presentation/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});//*Estas son las llaves del widget como tal

  @override
  Widget build(BuildContext context) {
                        //Nosotros queremos tener nuestra propia llave del este widget que esta dentró de otro widget
                        //*Indicamos que podemos manejar el estado de este scaffold de manera global.
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material3'),
      ),
      body: _HomeView(),

      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class _HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final MenuItem menuItem = appMenuItems[index];
        return CustomListTitle(menuItem: menuItem);
      },
      );
  }
}

class CustomListTitle extends StatelessWidget {
  final MenuItem menuItem;

  const CustomListTitle({
    super.key,
    required this.menuItem,
  }); 

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(//?Nuevo widget aprendido
      leading: Icon(menuItem.icon, color: colors.primary,),//*Esto indica la parte izquierda del ListTile
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary,), //*Esta es la parte derecha del ListTile
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        context.push(menuItem.link);
      },
    );
  }
}