import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo { //!Esto es como si estuvieramos creando una entidad
  final String title; 
  final String imageUrl; 
  final String caption;

  SlideInfo({required this.title, required this.imageUrl, required this.caption}); 


}

final slides = <SlideInfo>[
  SlideInfo(title: 'Busca la comida', imageUrl: 'assets/images/1.png', caption: 'Id nisi pariatur irure dolor aliquip Lorem sit labore et.'),
  SlideInfo(title: 'Ordena tu comida', imageUrl: 'assets/images/2.png', caption: 'Irure velit nostrud ullamco nisi aliquip dolor adipisicing elit.'),
  SlideInfo(title: 'Disfruta tu comida', imageUrl: 'assets/images/3.png', caption: 'Duis nostrud sint duis occaecat exercitation sit pariatur culpa sunt minim.'),
];


class AppTutorialScreen extends StatefulWidget {

  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();

  bool enReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {

      final page  = pageViewController.page ?? 0; //*si no tenemos el pageViewController su valor por defecto sera 0
      if(!enReached && page >= (slides.length - 1.5) ) {
        setState(() {
          enReached = true;
        });
      }
    });
  }    

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }                                                 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
        PageView( //?ESTE WIDGET OCUPA TODA LA PANTALLA Y PODEMOS HACER SCROLL
        controller: pageViewController,
          physics: const BouncingScrollPhysics(),
          children: slides.map((slideData) => _Slide(
            slideData.title, slideData.imageUrl, slideData.caption
            )).toList()//*Lo agrupamos a una lista para que sea una lista del widget _slide. Pues el children pide una lista de widget
          ),

        Positioned(
          top: 50,
          right: 20,
          child: TextButton(
            onPressed: () => context.pop(), 
            child: const Text('Skip')
            )
          ),

        enReached ? Positioned(
          bottom: 10,
          right: 20,
          child: FadeInRight(//? widget dle paquete de animate_do - 
            from: 15, //? Las unidades a las que se va a mover
            delay: const Duration( seconds: 1 ), //El tiempo en que aparecerá la animacion
            child: FilledButton(
              onPressed: () => context.pop(), 
              child: const Text('Exit')
              ),
          )
          ) : const SizedBox() //?size box es un widget que se aconsejo usar para no mostrar ningun widget -- sería como un widget de 0 pixeles
        ] 
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String caption;

  const _Slide(this.title, this.imageUrl, this.caption);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox( height: 20,),
            Text(title, style: titleStyle,),
            const SizedBox( height: 10,),
            Text(caption, style: captionStyle,),
          ],
        ),
      ),
    );
  }
}