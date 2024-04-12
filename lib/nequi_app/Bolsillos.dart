import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Bolsillos());
}

class Bolsillos extends StatelessWidget {
  const Bolsillos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tus Bolsillos',
            style: TextStyle(fontSize: 24.0, color: Color.fromARGB(255, 27, 26, 26), fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const VistaBolsillos(),
        ),
      ),
    );
  }
}

class VistaBolsillos extends StatefulWidget {
  const VistaBolsillos({Key? key}) : super(key: key);

  @override
  State<VistaBolsillos> createState() => _VistaBolsillosState();
}

class _VistaBolsillosState extends State<VistaBolsillos> {
  final List<String> nombres = List.generate(4, (index) => 'Bolsillo ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: nombres.length,
      itemBuilder: (BuildContext context, int index) {
        final String nombreCuadro = nombres[index];
        final Color colorCuadro = _generateRandomColor();
        return GestureDetector(
          onTap: () {
            print('Tapped on $nombreCuadro');
            
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: CustomPaint(
              painter: HalfPainter(colorCuadro),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white, 
                              borderRadius: BorderRadius.circular(6.0), 
                            ),
                            child: Icon(Icons.attach_money, size: 24.0, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 8.0, left: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nombreCuadro,
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 8), 
                          Text(
                            "0,00",
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 131, 131, 131),  fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Color _generateRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}

class HalfPainter extends CustomPainter {
  final Color color;

  HalfPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    // Dibujar la mitad superior del cuadro
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
