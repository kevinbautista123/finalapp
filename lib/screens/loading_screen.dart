import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo de la pantalla de carga con el color principal de la aplicación
      backgroundColor: const Color.fromARGB(255, 17, 31, 113), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Indicador de carga circular
            const CircularProgressIndicator(
              color: Color.fromARGB(255, 255, 110, 0), // Color de acento (Deep Orange)
              strokeWidth: 4,
            ),
            
            const SizedBox(height: 20),
            
            // Texto de carga
            const Text(
              'Cargando Productos...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            
            const SizedBox(height: 5),
            
            // Texto secundario
            Text(
              'Por favor, espere',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}