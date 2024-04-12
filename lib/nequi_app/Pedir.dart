import 'package:flutter/material.dart';
void main() {
  runApp(const Pedir());
}
class Pedir extends StatelessWidget {
  const Pedir({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Pide Plata',
            style: TextStyle(fontSize: 24.0, color: Color.fromARGB(255, 27, 26, 26), fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const FormPedir(),
        ),
      ),
    );
  }
}

class FormPedir extends StatefulWidget {
  const FormPedir({super.key});

  @override
  State<FormPedir> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormPedir> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            style: TextStyle(fontSize: 16.0),
            decoration: const InputDecoration(
              hintText: '¿A quién le vas a pedir?',
              suffixIcon: Icon(Icons.person_add_outlined), 
              filled: true, 
              fillColor: Color.fromRGBO(255, 235, 248, 1), 
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un número valido';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0), // Agrega espacio vertical
            child: TextFormField(
              decoration: InputDecoration(
                hintText: '¿Cuánto?',
                filled: true,
                fillColor: Color.fromRGBO(255, 235, 248, 1),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese un valor';
                }
                return null;
              },
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Mensaje',
              filled: true, 
              fillColor: Color.fromRGBO(255, 235, 248, 1),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un número valido';
              }
              return null;
            },
          ),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: SizedBox(
              width: double.infinity, // Ancho máximo
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Agregar aquí la lógica para el botón si es necesario
                  }
                },
                style: ElevatedButton.styleFrom(
                 primary: Color.fromRGBO(255, 58, 193, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Establecer el radio del borde a cero
                  ), // Cambiar el color de fondo del botón
                ),
                child: Text(
                  'Pedir Plata',
                  style: TextStyle(color: Colors.white), // Cambiar el color del texto a blanco
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
