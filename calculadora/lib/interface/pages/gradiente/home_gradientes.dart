import 'gradiente.dart';
import 'pages/gradiente_aritmetico.dart';

class HomeGradiente extends StatelessWidget {
  const HomeGradiente({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.background,
          title: const Center(child: Text('Gradiente')),
          bottom: const TabBar(indicatorColor: Colors.white, tabs: [
            Tab(
              text: 'Geométrico',
            ),
            Tab(
              text: 'Aritmetico',
            )
          ]),
        ),
        body: const TabBarView(children: [
          GradienteAritmetico(),
          Text('Hola'),
        ]),
      ),
    );
  }
}
