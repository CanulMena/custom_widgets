import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),

      body: _BottonsView(),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: Icon(Icons.arrow_back_ios_new_rounded, color:colors.primary,),
        ),
    );
  }
}

class _BottonsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity, //*Definiremos el espacio que puede tomar el wrap de una vez
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap( //*El espacio del wrap se va definiendo, no viene definido. 
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [

            ElevatedButton(onPressed: (){}, child: const Text('Elevated')),
            const ElevatedButton(onPressed: null, child: Text('Disnable Elavated')),
            ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.lock_clock_sharp), label: const Text('Elevated Icon')),
      
            FilledButton(onPressed: (){}, child: const Text('Filled')),
            FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.access_alarm_outlined), label: const Text('Filled Icon')),

            OutlinedButton(onPressed: (){}, child: const Text('Outlined')),
            OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.cloud), label: const Text('Icon Outline')),

            TextButton(onPressed: (){}, child: const Text('Text')),
            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.telegram), label: const Text('Icon Text')),

            _CustomButton(),

            IconButton(onPressed: (){}, icon: const Icon(Icons.insert_comment_rounded)),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.abc,),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white),
              )
              ),
            IconButton.filled(onPressed: (){}, icon: const Icon(Icons.filter_list_alt)),

          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell( //? Este Widget es muy parecido al gesture dector
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Custom Button', style: TextStyle( color: Colors.white),),
          ),
        ),
      ),
    );
    
  }
}