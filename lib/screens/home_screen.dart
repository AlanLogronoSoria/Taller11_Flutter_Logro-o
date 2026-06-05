import 'package:flutter/material.dart';
import '../widgets/proyecto_card_mini.dart';
import '../widgets/proyecto_card.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Mi Portafolio'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mis Proyectos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 2 columnas
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85, // Proporción ancho/alto
                // Se removió 'const' de aquí para permitir la navegación
                children: [
                  
                  // Proyecto 1
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            appBar: AppBar(
                              title: const Text('Detalle del Proyecto'),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            body: const Center(
                              child: ProyectoCard(titulo: 'Proyecto 1', descripcion: 'Descripción del Proyecto 1', tecnologias: 'Tecnologías del Proyecto 1', estado: 'En progreso'),
                            ),
                          ),
                        ),
                      );
                    },
                    child: const ProyectoCardMini(
                      titulo: 'Proyecto 1', 
                      icono: Icons.web,
                    ),
                  ),

                  // Proyecto 2
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            appBar: AppBar(
                              title: const Text('Detalle del Proyecto'),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            body: const Center(
                              child: ProyectoCard(titulo: 'Proyecto 2', descripcion: 'Descripción del Proyecto 2', tecnologias: 'Tecnologías del Proyecto 2', estado: 'En progreso'),
                            ),
                          ),
                        ),
                      );
                    },
                    child: const ProyectoCardMini(
                      titulo: 'Proyecto 2', 
                      icono: Icons.phone_android,
                    ),
                  ),

                  // Proyecto 3
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            appBar: AppBar(
                              title: const Text('Detalle del Proyecto'),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            body: const Center(
                              child: ProyectoCard(titulo: 'Proyecto 3', descripcion: 'Descripción del Proyecto 3', tecnologias: 'Tecnologías del Proyecto 3', estado: 'En progreso' ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: const ProyectoCardMini(
                      titulo: 'Proyecto 3', 
                      icono: Icons.shopping_cart,
                    ),
                  ),

                  // Proyecto 4
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            appBar: AppBar(
                              title: const Text('Detalle del Proyecto'),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            body: const Center(
                              child: ProyectoCard( titulo: 'Proyecto 4', descripcion: 'Descripción del Proyecto 4', tecnologias: 'Tecnologías del Proyecto 4', estado: 'En progreso' ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: const ProyectoCardMini(
                      titulo: 'Proyecto 4', 
                      icono: Icons.games,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}