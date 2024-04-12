import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Colchon.dart'; // Importa la clase Colchon

class NequiHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1f0020), // Cambio del color de fondo
        titleSpacing: 0,
        title: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hola.',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                SizedBox(height: 2),
                Text(
                  'Usuario',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            SizedBox(width: 8.0),
          ],
        ),
        actions: <Widget>[
          _OutlinedIcon(
            icon: Icons.notifications_outlined,
            onPressed: () {
              // Acción cuando se presiona la campana
            },
          ),
          SizedBox(width: 15.0),
          Icon(Icons.help_outline, size: 24, color: Colors.white),
          SizedBox(width: 15.0),
          _OutlinedIcon(
            icon: Icons.lock_outlined,
            onPressed: () {
              // Acción cuando se presiona el ícono del candado
            },
          ),
        ],
        leading: Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.only(left: 4.0),
          child: Icon(Icons.person_outline, color: Colors.white),
          decoration: BoxDecoration(
            color: Color(0xFF550055),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      body: Column(
        children: [
          // Agrega la imagen debajo del encabezado
          Container(
            constraints:
                BoxConstraints(maxWidth: 600), // Ancho máximo para la imagen
            child: AspectRatio(
              aspectRatio: 16 / 9, // Relación de aspecto de la imagen
              child: Image.asset(
                'nequi.jpg',
                fit: BoxFit
                    .cover, // Ajustar la imagen para cubrir el espacio disponible
              ),
            ),
          ),
          // Agrega el GridView
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Número de columnas
                childAspectRatio:
                    3 / 4, // Proporción de aspecto de cada elemento
              ),
              itemCount: 3, // Número total de elementos en el GridView
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Verificar si se selecciona la imagen de colchón
                    if (index == 1) {
                      // Navegar a la clase Colchon si se selecciona la imagen de colchón
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Colchon()),
                      );
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 38.0), // Espacio desde arriba
                      Image.asset(
                        _getImagePath(index),
                        // Obtener la ruta de la imagen según el índice
                        height: 100.0, // Altura de la imagen
                      ),
                      SizedBox(height: 4), // Espacio entre la imagen y el texto
                      Text(
                        _getLabelText(index),
                        // Obtener el texto según el índice
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ), // Texto debajo de la imagen
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10), // Espacio en blanco para subir el carrusel
          // Agregar el carrusel aquí
          Container(
            margin: EdgeInsets.only(
                top: 10), // Espacio en la parte superior del carrusel
            child: Transform.translate(
              offset: Offset(0, -70), // Desplazar el carrusel hacia arriba
              child: CarouselSlider.builder(
                itemCount: 7, // Número total de imágenes en el carrusel
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return SizedBox(
                    width: double
                        .infinity, // Ajusta el ancho de la imagen al ancho disponible
                    child: Image.asset(
                      'Carrusel/${index + 1}.png',
                      // Ruta de la imagen en la carpeta Carrusel
                      fit: BoxFit.scaleDown,
                      // Ajusta el tamaño de la imagen para que no se estire
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 100.0, // Altura del carrusel
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.3, // Fracción de la ventana visible
                  initialPage: 1,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        bottom: 10.0), // Ajusta la distancia desde abajo
                    child: Card(
                      elevation: 4,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      child: Padding(
                        padding:
                            const EdgeInsets.all(8.0), // Ajusta el padding aquí
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Icon(Icons.home),
                                    SizedBox(
                                        height:
                                            1), // Ajustar el espaciado vertical
                                    Text(
                                      'Inicio',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.article_outlined),
                                    SizedBox(
                                        height:
                                            1), // Ajustar el espaciado vertical
                                    Text(
                                      'Movimientos',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.grid_view),
                                    SizedBox(
                                        height:
                                            1), // Ajustar el espaciado vertical
                                    Text(
                                      'Servicios',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                                height: 8.0), // Reducido el tamaño del SizedBox
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Container(
                  margin: EdgeInsets.only(
                      bottom: 10.0), // Ajusta la distancia desde abajo
                  decoration: BoxDecoration(
                    color: Colors.pink, // Color del contenedor
                    borderRadius:
                        BorderRadius.circular(8.0), // Borde redondeado
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 3), // Cambia la posición de la sombra
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.attach_money,
                      color: Colors.white,
                      size: 30, // Ajusta el tamaño del icono
                    ),
                    onPressed: () {
                      // Acción al presionar el botón
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Método para obtener la ruta de la imagen según el índice
  String _getImagePath(int index) {
    switch (index) {
      case 0:
        return 'Iconos/Tarjeta.png';
      case 1:
        return 'Iconos/Colchon.png';
      case 2:
        return 'Iconos/Bolsillo.png';
      default:
        return '';
    }
  }

  // Método para obtener el texto según el índice
  String _getLabelText(int index) {
    switch (index) {
      case 0:
        return 'Tarjeta';
      case 1:
        return 'Colchón';
      case 2:
        return 'Bolsillo';
      default:
        return '';
    }
  }
}

class _OutlinedIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const _OutlinedIcon({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
