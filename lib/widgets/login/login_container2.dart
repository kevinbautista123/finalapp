import 'package:flutter/material.dart';
// ¡CORREGIDO! Usando el nombre de tu proyecto: finalapp_kevin
import 'package:finalapp_kevin/widgets/widgets.dart'; 
import 'package:finalapp_kevin/widgets/diamonds.dart'; 

// Contenedor superior para la pantalla de Login/Registro.
class LoginContainer2 extends StatelessWidget {
  const LoginContainer2({super.key});
  
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    
    return Container(
      width: double.infinity,
      // Ocupa el 40% de la altura de la pantalla
      height: sizeScreen.height * 0.4, 
      decoration: const BoxDecoration( 
        // Gradiente de color para el fondo de la cabecera
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(107, 133, 220, 1),
            Color.fromRGBO(17, 31, 113, 1),
          ],
        ),
      ),
      child: const Stack( 
        children: [
          // Rombos (DiamondShape) posicionados aleatoriamente como decoración de fondo
          Positioned(top: 90, left: 30, child: DiamondShape()),
          Positioned(top: -40, left: -30, child: DiamondShape()),
          Positioned(top: -50, left: -20, child: DiamondShape()),
          Positioned(top: 120, right: 20, child: DiamondShape()),
          Positioned(top: 20, right: 80, child: DiamondShape()),
          Positioned(top: -50, right: -20, child: DiamondShape()),
        ],
      ),
    );
  }
}