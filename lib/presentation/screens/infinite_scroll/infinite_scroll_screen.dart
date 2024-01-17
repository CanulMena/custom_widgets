import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5];
  bool isLoading = false;
  bool isMounted = true;

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if( ( scrollController.position.pixels + 500 ) >= scrollController.position.maxScrollExtent ){
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {

    // Si isLoading es true, significa que ya se está cargando más contenido,
    // así que salimos temprano de la función.
    if( isLoading ) return; 

    // Establecemos isLoading en true para indicar que estamos comenzando a cargar. dado que is loading no saea true
    isLoading = true;

    // Usamos setState para reconstruir la interfaz de usuario y mostrar un indicador de carga.
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();

    // Establecemos isLoading en false para indicar que hemos terminado de cargar.
    isLoading = false;

    if( !isMounted ) return; //*Utilizmaos para comprobar si la funcion se esta completando - ya que no podemos usar el setState de una funcion asyncrona que no existe y aquello nos daría grandes problemas y si no esta montado terminamos la funcion asyncrona para no tener problemas
    setState(() {
      moveScrollToBottom();
    });//así que antes de llamar este setState verificamos si este componente ya esta montando para que no rompa la aplicacion
  }

  void addFiveImages(){
    final lastId = imagesIds.last;

    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    if( !isMounted ) return;
    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    setState(() {});
  }

  void moveScrollToBottom() {
//*si la pocision actual mas 100 pixeles es menor al maximo del scroll  no entra a la condicion y termina el metodo. 
    if(scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;
//*Pero si es mayor - llego al final del scroll. creará lo siguiente: 
    scrollController.animateTo(
      scrollController.position.pixels + 120, //moverá el scroll actual mas 120 pixeles
      duration: const Duration(milliseconds: 300), //lo hará en 300 milisegundos 
      curve: Curves.fastOutSlowIn //Este es el efecto que hará para irse abajo
      );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,

      body: MediaQuery.removePadding( //*se agrego para poder eliminar la parte superior del sistema
        context: context,
        removeTop: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),//*el efecto del desplazamiento
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), //? Esta es la imagen que saldrá mientras se esta cargando la principal
                image: NetworkImage('https://picsum.photos/id/${ imagesIds[index] }/500/300') //anchura - altura
                );
            },
            ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading 
        ? SpinPerfect(
          infinite: true,
          child: const Icon(Icons.refresh_rounded),
          ) 
        : FadeIn(child: const Icon(Icons.arrow_back)) //*Agregamos FadeIn para que cada vez que se construya el widget tire su animacion de reconstruccion
      )
    );
  }
}