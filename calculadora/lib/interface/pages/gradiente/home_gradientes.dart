import 'aritmetico/pages/pages.dart';
import 'aritmetico/pages/gradiente_aritmetico.dart';
import 'geometrico/pages/gradiente_geometrico.dart';

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
              text: 'Aritmetico',
            ),
            Tab(
              text: 'Geométrico',
            ),
          ]),
        ),
        body: const TabBarView(children: [
          GradienteAritmetico(),
          GradienteGeometrico(),
        ]),
      ),
    );
  }
}
