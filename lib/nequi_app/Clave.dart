import 'package:flutter/material.dart';
import 'package:nequi/nequi_app/Inicio.dart';
import 'package:nequi/nequi_app/NequiLoginPage.dart'; // Importar la clase NequiLoginPage

class Clave extends StatefulWidget {
  @override
  _ClaveState createState() => _ClaveState();
}

class _ClaveState extends State<Clave> {
  List<String> passwordValues = List.filled(4, ''); // Lista para almacenar los valores de la contraseña

  void insertNumber(String number) {
    // Insertar número en el primer campo de texto disponible
    for (int i = 0; i < passwordValues.length; i++) {
      if (passwordValues[i].isEmpty) {
        setState(() {
          passwordValues[i] = number; // Insertar el número en el campo de texto correspondiente
        });
        // Verificar si todos los campos están llenos
        if (passwordValues.every((value) => value.isNotEmpty)) {
          // Navegar a la página NequiHomePage si todos los campos están llenos
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NequiHomePage()),
          );
        }
        break;
      }
    }
  }

  void deleteNumber() {
    // Eliminar el último número de la contraseña
    for (int i = passwordValues.length - 1; i >= 0; i--) {
      if (passwordValues[i].isNotEmpty) {
        setState(() {
          passwordValues[i] = ''; // Limpiar el valor del campo de texto
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = Color(0xFFDA0081); // Color del botón "Eliminar"

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Manrope', // Establecer la fuente Manrope
      ),
      home: Scaffold(
        backgroundColor: Color(0xFF330032), // Color de fondo personalizado
        appBar: AppBar(
          backgroundColor: Color(0xFF330032), // Color de fondo del appbar
          elevation: 0, // Sin sombra
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              // Redirigir a NequiLoginPage cuando se presione la flecha de volver
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NequiLoginPage()),
              );
            },
          ),
          title: SizedBox.shrink(), // Ocultar el título
          centerTitle: true, // Centrar el título en el appbar
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20), // Espacio adicional agregado
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Escribe tu Clave',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30, // Tamaño de fuente
                      ),
                    ),
                    SizedBox(height: 10), // Espacio adicional agregado
                  ],
                ),
              ),
              SizedBox(
                  height:
                      50), // Espacio adicional entre el texto y los campos de texto
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < 4; i++)
                    Container(
                      width: 60.0,
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0), // Añadir margen horizontal
                      child: TextField(
                        readOnly: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border:
                              InputBorder.none, // Eliminar borde del TextField
                        ),
                        controller: TextEditingController(
                          text: passwordValues[i].isEmpty
                              ? ''
                              : '*', // Mostrar * si hay un valor en el campo de texto
                        ),
                        style: TextStyle(
                          color: buttonColor, // Color del botón "Eliminar"
                          fontSize: 30.0, // Tamaño de fuente más grande
                        ),
                      ),
                    ),
                ],
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height /
                    6, // Mitad de la altura de la pantalla
                child: Center(
                  child: Text(
                    'No dudamos que seas tú...\nPero es mejor confirmar ;)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0), // Ajustar el margen superior del teclado
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing:
                      40.0, // Ajustar la separación horizontal entre los elementos

                  shrinkWrap: true,
                  padding: EdgeInsets.all(2.0),
                  children: [
                    for (int i = 1; i <= 9; i++)
                      GestureDetector(
                        onTap: () {
                          insertNumber(i.toString());
                        },
                        child: buildNumberButton(i.toString()),
                      ),
                    SizedBox(), // Espacio en blanco para alinear el botón de eliminar debajo del 9
                    GestureDetector(
                      onTap: () {
                        insertNumber('0');
                      },
                      child: buildNumberButton('0'),
                    ),
                    GestureDetector(
                      onTap: () {
                        deleteNumber();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Icon(
                          Icons.backspace,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 0.0), // Ajustar el margen inferior del enlace
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      // Implementa aquí la lógica para el enlace ¿Se te olvidó?
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 1.0, // Grosor del subrayado
                          ),
                        ),
                      ),
                      child: Text(
                        '¿Se te olvidó?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNumberButton(String content) {
    return Container(
      width: 70.0,
      height: 70.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: Text(
        content,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
        ),
      ),
    );
  }
}

void main() {
  runApp(Clave());
}
