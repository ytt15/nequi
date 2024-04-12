import 'package:flutter/material.dart';

class RetiroOption {
  final String title;
  final String subtitle;
  final IconData icon;

  RetiroOption({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class RetiroScreen extends StatelessWidget {
  final List<RetiroOption> opciones = [
    RetiroOption(
      title: 'Hacer retiros en cajero',
      subtitle: 'Retira dinero en cajeros automáticos',
      icon: Icons.atm,
    ),
    RetiroOption(
      title: 'Punto físico',
      subtitle: 'Retira dinero en establecimientos asociados',
      icon: Icons.store,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opciones de retiro'),
      ),
      body: ListView.builder(
        itemCount: opciones.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(opciones[index].icon),
              title: Text(opciones[index].title),
              subtitle: Text(opciones[index].subtitle),
              onTap: () {
                // Acción a realizar al seleccionar una opción
                // Por ejemplo, mostrar un diálogo o navegar a otra pantalla
                print('Seleccionaste: ${opciones[index].title}');
              },
            ),
          );
        },
      ),
    );
  }
}