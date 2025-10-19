import 'package:flutter/material.dart';
import 'package:finalapp_kevin/widgets/widgets.dart'; 

// Pantalla principal de la aplicación con opciones de navegación.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Color del AppBar: Usamos un tono del degradado azul que hemos estado usando.
        backgroundColor: const Color.fromRGBO(17, 31, 113, 1), 
        foregroundColor: Colors.white,
        
        // Flecha hacia atrás (Volver a Login)
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navegación de vuelta a la pantalla de login
            Navigator.pushReplacementNamed(context, 'login'); 
          },
        ),
        
        title: const Text('Menú Principal'),
        
        // 2. Icono de Perfil (MODIFICADO: No hace nada)
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            // La función onPressed está vacía, por lo que no dirige a ningún lugar.
            onPressed: () {}, 
          ),
        ],
      ),
      
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Texto de Bienvenida / Título
              const Text(
                'Bienvenido, ¿qué deseas hacer hoy?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 30),
              
              // Botones de Navegación (Usando el widget Button.dart)
              Button(textButton: 'Ver productos', pathButton: 'list_product'),
              const SizedBox(height: 15),
              Button(textButton: 'Gestión de Categorías', pathButton: 'Error'),
              const SizedBox(height: 15),
              Button(textButton: 'Gestión de Proveedores', pathButton: 'Error'),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}