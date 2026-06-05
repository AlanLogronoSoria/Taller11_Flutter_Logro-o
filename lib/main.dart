import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Quita el banner de "Debug" en la esquina superior derecha
      debugShowCheckedModeBanner: false,

      //Titulo de la aplicación
      title: 'Mi Portafolio',

      // Tema de colores de la aplicación
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),

      // Pantalla de inicio
      home: const HomeScreen(),
    );
  }
}