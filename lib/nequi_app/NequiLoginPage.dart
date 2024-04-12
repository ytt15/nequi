import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importar para utilizar FilteringTextInputFormatter
import 'package:nequi/nequi_app/Clave.dart';

class NequiLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF330032), // Color de fondo personalizado
      body: Stack(
        children: [
          // Aquí agregamos la imagen del logo de Nequi
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: 220,
                  top: 50.0), // Ajuste de la posición vertical de la imagen
              child: Image.asset(
                'logonequi.png', // Ruta de la imagen del logo de Nequi
                height: 100, // Altura deseada para la imagen
                // Ajuste de la imagen al centro horizontalmente
                alignment: Alignment.center,
              ),
            ),
          ),
          // Contenedor para los campos de texto y el botón
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Container(
              padding:
                  EdgeInsets.fromLTRB(20, 20, 20, 40), // Ajuste de los márgenes
              decoration: BoxDecoration(
                color: Color(0xFF330032),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(
                              0xFF5F005F), // Color de fondo del contenedor de +57
                          border:
                              Border.all(color: Colors.white.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.all(
                            10.0), // Ajuste del espaciado interno
                        height: 48.0,
                        child: Center(
                          child: Text(
                            '+57',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          width:
                              10), // Espacio entre el contenedor de +57 y el campo de texto
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Número de celular',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            filled:
                                true, // Hacer que el campo de texto esté lleno
                            fillColor: Color(
                                0xFF5F005F), // Color de fondo del campo de texto
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal:
                                    10.0), // Ajuste del espaciado interno
                          ),
                          keyboardType:
                              TextInputType.number, // Teclado numérico
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9]')), // Solo permite números
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navegar a la pantalla de Clave cuando se presione el botón "SIGUIENTE"
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Clave()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFDA0081), // Color del botón
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Text(
                      'Entra',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
