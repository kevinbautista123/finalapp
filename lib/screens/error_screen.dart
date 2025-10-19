import 'package:flutter/material.dart';

// Pantalla para mostrar errores genéricos de navegación o de aplicación.
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error de Navegación'),
        backgroundColor: Colors.red[800], // Color de error
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 80,
              ),
              const SizedBox(height: 20),
              
              // Mensaje de error
              const Text(
                '¡Vaya! La ruta o pantalla solicitada no se pudo encontrar.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),
              
              // Botón para volver al inicio
              ElevatedButton.icon(
                onPressed: () {
                  // Navega de vuelta a la pantalla de inicio (ruta 'home')
                  Navigator.pushReplacementNamed(context, 'home'); 
                },
                icon: const Icon(Icons.home),
                label: const Text(
                  'Volver a Inicio',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}