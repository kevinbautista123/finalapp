import 'package:flutter/material.dart';

// Widget que dibuja una forma de diamante (rombo) rotando un Container.
class DiamondShape extends StatelessWidget {
  const DiamondShape({super.key});
  
  @override
  Widget build(BuildContext context) {
    // Rotamos el Container 45 grados para crear la forma de rombo.
    return Transform.rotate(
      angle: 0.785398, // 45 grados en radianes
      child: Container(
        width: 100, 
        height: 100, 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), 
          // Color blanco con baja opacidad para un efecto sutil
          color: const Color.fromRGBO(255, 255, 255, 0.15),
        ),
      ),
    );
  }
}