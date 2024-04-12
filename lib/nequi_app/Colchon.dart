import 'package:flutter/material.dart';

class Colchon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.arrow_back, color: Color(0xFF660066)),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Tu Colchón',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                color: Color(0xFF550055), // Color de fondo del card morado
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.zero, // Eliminar bordes redondeados
                ),
                child: Stack(
                  children: [
                    Container(
                      width: 200,
                      height: 80,
                      color: Colors.transparent,
                    ),
                    Positioned(
                      top: 10,
                      right: 20,
                      child: Container(
                        width: 30,
                        height: 30,
                        color: Colors.pink,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 55,
                      child: Container(
                        width: 30,
                        height: 30,
                        color: Colors.pink,
                      ),
                    ),
                    Positioned(
                      top: 15,
                      right: 55,
                      child: Container(
                        width: 20,
                        height: 20,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      right: 30,
                      child: Container(
                        width: 20,
                        height: 20,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.only(top: 0), // Ajustar margen superior
                child: SizedBox(
                  height: 60, // Mismo alto que el card morado
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: '\$ 0',
                          ),
                          TextSpan(
                            text: ',00',
                            style: TextStyle(
                              fontSize: 16, // Tamaño más pequeño
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Espacio entre los dos Cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 4,
                color: Color(0xFFFEF4F6), // Nuevo color
                child: SizedBox(
                  height: 55, // Altura ajustada para el tercer card
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '¿Cuánto vas a meter?',
                          style: TextStyle(
                            fontSize: 12, // Tamaño más pequeño
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                // Acción al presionar el botón -
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                // Acción al presionar el botón +
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Colchon(),
  ));
}
