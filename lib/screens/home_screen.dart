import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _selectedIndex;

  final List<Map<String, dynamic>> _proyectos = [
    {
      'titulo': 'ESFOT GO',
      'descripcion': 'Aplicación mobile para la geolocalización en el Campus Universitario junto con catálogo digital de eventos.',
      'tecnologias': ['TypeScript', 'MongoDB', 'OpenStreetMap'],
      'estado': 'En 50% de Desarrollo',
      'icono': Icons.map_outlined,
      'color': Color(0xFF6C63FF),
      'chipColor': Color(0xFFFFF8E6),
      'chipTextColor': Color(0xFF9B6E00),
    },
    {
      'titulo': 'Petadopt-Web',
      'descripcion': 'Plataforma web enfocada en la gestión de mascotas, adopciones y autenticación segura de usuarios.',
      'tecnologias': ['React', 'Node.js', 'Vercel'],
      'estado': 'Desplegado',
      'icono': Icons.pets_outlined,
      'color': Color(0xFFFF6B9D),
      'chipColor': Color(0xFFEEF3FF),
      'chipTextColor': Color(0xFF4040CC),
    },
    {
      'titulo': 'Calculadora UDP',
      'descripcion': 'Sistema cliente-servidor con interfaz gráfica para el procesamiento remoto de operaciones matemáticas.',
      'tecnologias': ['JavaFX', 'DatagramSockets', 'UDP'],
      'estado': 'Completado',
      'icono': Icons.calculate_outlined,
      'color': Color(0xFFF7B731),
      'chipColor': Color(0xFFEAF7F1),
      'chipTextColor': Color(0xFF1A7A4A),
    },
    {
      'titulo': 'Reconocimiento AI',
      'descripcion': 'Sistema basado en inteligencia artificial para la identificación automática de especies de plantas.',
      'tecnologias': ['Python', 'TensorFlow', 'Machine Learning'],
      'estado': 'Completado',
      'icono': Icons.eco_outlined,
      'color': Color(0xFF4ECDC4),
      'chipColor': Color(0xFFEAF7F1),
      'chipTextColor': Color(0xFF1A7A4A),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PROYECTOS',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.4,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                  const SizedBox(height: 14),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: _proyectos.length,
                    itemBuilder: (context, index) {
                      return _buildCardMini(index);
                    },
                  ),
                  if (_selectedIndex != null) ...[
                    const SizedBox(height: 16),
                    _buildDetailCard(_proyectos[_selectedIndex!]),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: const Color(0xFF0A0A0A),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12,
        bottom: 16,
        left: 20,
        right: 20,
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFF4ECDC4)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Center(
              child: Text(
                'MV',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mi Portafolio',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                'Desarrollador de Software',
                style: TextStyle(
                  color: Color(0x66FFFFFF),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: Color(0xFF4ECDC4),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'Disponible',
                style: TextStyle(
                  color: Color(0x66FFFFFF),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardMini(int index) {
    final p = _proyectos[index];
    final isSelected = _selectedIndex == index;
    final color = p['color'] as Color;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = isSelected ? null : index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? color.withOpacity(0.6) : const Color(0xFFE0E0E0),
            width: isSelected ? 1.5 : 0.5,
          ),
          boxShadow: isSelected
              ? [BoxShadow(color: color.withOpacity(0.15), blurRadius: 12, offset: const Offset(0, 4))]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Stack(
            children: [
              Positioned(
                top: 0, left: 0, right: 0,
                child: Container(height: 3, color: color),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 18, 14, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(p['icono'] as IconData, color: color, size: 20),
                    ),
                    const Spacer(),
                    Text(
                      p['titulo'] as String,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: p['chipColor'] as Color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        p['estado'] as String,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: p['chipTextColor'] as Color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(Map<String, dynamic> p) {
    final color = p['color'] as Color;
    final techs = p['tecnologias'] as List<String>;

    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE0E0E0), width: 0.5),
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(p['icono'] as IconData, color: color, size: 24),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p['titulo'] as String,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: p['chipColor'] as Color,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          p['estado'] as String,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: p['chipTextColor'] as Color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            const Divider(height: 1, color: Color(0xFFEEEEEE)),
            const SizedBox(height: 14),
            Text(
              p['descripcion'] as String,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF666666),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'TECNOLOGÍAS',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
                color: Color(0xFFAAAAAA),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: techs.map((t) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFFE0E0E0), width: 0.5),
                ),
                child: Text(
                  t,
                  style: const TextStyle(fontSize: 12, color: Color(0xFF555555)),
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}