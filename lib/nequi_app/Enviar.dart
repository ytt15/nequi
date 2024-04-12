import 'package:flutter/material.dart';
void main() {
  runApp(const Enviar());
}
class Enviar extends StatelessWidget {
  const Enviar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Envía plata',
            style: TextStyle(fontSize: 24.0, color: Color.fromARGB(255, 27, 26, 26), fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const FormEnvio(),
        ),
      ),
    );
  }
}

class FormEnvio extends StatefulWidget {
  const FormEnvio({super.key});

  @override
  State<FormEnvio> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormEnvio> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _source = 'Disponible'; 

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
              hintText: 'Cel',
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
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'Revisa bien el número para enviarle a la persona correcta',
              style: TextStyle(color: Color(0xD3D3D3D3)),
            ),
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
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'Escoge de donde saldra la plata',
              style: TextStyle(color: Color.fromRGBO(255, 58, 193, 1)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0), 
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: 'Fuente de dinero',
                filled: true,
                fillColor: Color.fromRGBO(255, 255, 255, 1),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 58, 193, 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2), 
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.account_balance_wallet_outlined, 
                      color: Colors.white, 
                    ),
                  ),
                ),
              ),
              value: _source,
              onChanged: (String? newValue) {
                setState(() {
                  _source = newValue; // Actualiza la variable _source con el valor seleccionado
                });
              },
              items: <String>['Disponible', 'Bolsillo 1', 'Bolsillo 2', 'Bolsillo 3', 'Bolsillo 4']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor seleccione una opción';
                }
                return null;
              },
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(255, 58, 193, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text(
                      'Enviar Plata',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
