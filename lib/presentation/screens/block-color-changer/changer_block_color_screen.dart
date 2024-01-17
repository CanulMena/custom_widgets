import 'package:flutter/material.dart';

class ChangerBlockColorScreen extends StatefulWidget {
  const ChangerBlockColorScreen({super.key});

  @override
  State<ChangerBlockColorScreen> createState() => _ChangerBlockColorScreenState();
}

class _ChangerBlockColorScreenState extends State<ChangerBlockColorScreen> {

  List<Widget> tiles = [];

  @override
  void initState() {
    super.initState();
    tiles = [
      StatlessColorfulTile(color: Colors.red,  key: UniqueKey(),),
      StatlessColorfulTile(color: Colors.blue,  key: UniqueKey(),),
      
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: SafeArea(
        child: Row(
          children: tiles,
        ),),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          swapTiles();
        },
      ),
    );
  }

  void swapTiles(){
    setState(() {
    tiles.insert(1, tiles.removeAt(0));

    /**tiles.insert(1, tiles.removeAt(0));:

    tiles.removeAt(0) elimina el primer elemento de la lista tiles.
    tiles.insert(1, ...) inserta el elemento eliminado en la posición 1 de la lista.
    Esto tiene el efecto de mover el primer elemento a la posición 1 y desplazar el elemento original en la posición 1 a la posición 0. 
    */

    });
  }

}

class StatlessColorfulTile extends StatelessWidget {
  final Color color;
  const StatlessColorfulTile({
    super.key, 
    required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: color,
    );
  }
}