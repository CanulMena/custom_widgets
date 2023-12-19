import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
              //?Estoy definiendo una lista da mapas que tendrá un parametro de tipo string y un argumento dynamic
const cards = <Map<String, dynamic>>[
  {'elevation' : 0.0, 'label': 'Elevation 0'},//00
  {'elevation' : 1.0, 'label': 'Elevation 1'},//01
  {'elevation' : 2.0, 'label': 'Elevation 2'},//02
  {'elevation' : 3.0, 'label': 'Elevation 3'},//03
  {'elevation' : 4.0, 'label': 'Elevation 4'},//04
  {'elevation' : 5.0, 'label': 'Elevation 5'},//05

];

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
          ),
        title: const Text('CardsScreen'),
      ),
      body: _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //?Gracias al spread operator convertimos cada card que regresa cards.map a un widget llamado _CardType1.
          //?Relamente lo desempaquetamos
          ...cards.map((card) => _CardType1(
            elevation: card['elevation'],  
            label: card['label'], 
            )),
          /*
          !Gracias a spread operator simplifica este proceso y esto se ve algo tal que así: 
          ?_CardType1(elevation: 0.0, label: 'Elevation 0'),
          ?_CardType1(elevation: 1.0, label: 'Elevation 1'),
          *Por que sino, tendríamos que repertir este proceso y consumir una lista.
           */
          ...cards.map((card) => _CardType2(
            elevation: card['elevation'],  
            label: card['label'], 
            )),

          ...cards.map((card) => _CardType3(
            elevation: card['elevation'],  
            label: card['label'], 
            )),

          ...cards.map((card) => _CardType4(
            elevation: card['elevation'],  
            label: card['label'], 
            )),
          
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType1({
    required this.label, 
    required this.elevation
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  
                },
                icon: const Icon(Icons.more_vert_outlined),
              )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType2({
    required this.label, 
    required this.elevation
    });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: colors.outline
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12))
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  
                },
                icon: const Icon(Icons.more_vert_outlined),
              )),
            Align(
            alignment: Alignment.bottomLeft,
            child: Text('$label - outline'),
            )
          ],
        ),
      ),
    );
  }
} 

class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType3({
    required this.label, 
    required this.elevation
    });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  
                },
                icon: const Icon(Icons.more_vert_outlined),
              )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - filled'),
            )
          ],
        ),
      ),
    );
  }
}
class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType4({
    required this.label, 
    required this.elevation
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [

          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/350',
            height: 350,
            // width: 600,
            fit: BoxFit.cover,
          ),

          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12)),
                color: Colors.white
              ),
              child: IconButton(
                onPressed: () {
                  
                },
                icon: const Icon(Icons.more_vert_outlined),
              ),
            )),
        ],
      ),
    );
  }
}
