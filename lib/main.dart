import 'package:flutter/material.dart';
import 'package:nequi/nequi_app/Bolsillos.dart';
import 'package:nequi/nequi_app/Pedir.dart';
import 'package:nequi/nequi_app/Servicios.dart';
import 'package:nequi/nequi_app/Enviar.dart';
import 'package:nequi/nequi_app/Servicios.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Pedir(),
    );
  }
}
