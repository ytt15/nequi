import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const Servicios());
}

class Servicios extends StatelessWidget {
  const Servicios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Servicios',
            style: TextStyle(
              fontSize: 24.0,
              color: Color.fromARGB(255, 27, 26, 26),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: const ServiciosPage(),
        ),
      ),
    );
  }
}

class ServiciosPage extends StatefulWidget {
  const ServiciosPage({Key? key}) : super(key: key);

  @override
  State<ServiciosPage> createState() => _ServiciosPageState();
}

class _ServiciosPageState extends State<ServiciosPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: '¿Qué servicio necesitas?',
              prefixIcon: Icon(Icons.search),
              filled: true, 
              fillColor: Colors.grey[200], 
              border: OutlineInputBorder(
                borderSide: BorderSide.none, 
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onChanged: (value) {
            },
          ),
          TextFormField(
            style: TextStyle(fontSize: 16.0),
            decoration: const InputDecoration(
              hintText: 'Categorias',
              prefixIcon: Icon(Icons.grid_view_sharp),
              border: InputBorder.none,
            ),
          ),
          SizedBox(height: 20.0), 
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, 
              childAspectRatio: 2.0, 
              mainAxisSpacing: 10.0, 
              crossAxisSpacing: 10.0, 
              children: List.generate(8, (index) {
                return RectangleWidget(icon: _randomIcon());
              }),
            ),
          ),
        ],
      ),
    );
  }

  IconData _randomIcon() {
  List<IconData> icons = [
    Icons.ac_unit_outlined,
    Icons.access_alarm_sharp,
    Icons.access_time,
    Icons.account_balance_outlined,
    Icons.account_balance_wallet_outlined,
    Icons.account_box_outlined,
    Icons.account_circle_outlined,
    Icons.add_a_photo_outlined,
    Icons.add_box_outlined,
    Icons.add_circle_outline,
  ];

  int randomIndex = Random().nextInt(icons.length);
  return icons[randomIndex];
}

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class RectangleWidget extends StatelessWidget {
  final IconData icon;

  const RectangleWidget({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 10.0,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 40, 
            color: Colors.pink, 
          ),
          SizedBox(width: 10), 
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Center(
                child: Text(
                  'Servicio', 
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20, 
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
