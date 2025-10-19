import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  
  const CardContainer({
    super.key, 
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    // 1. Padding Horizontal para separarlo de los bordes de la pantalla
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(25), // Aumentamos un poco el padding interno
        decoration: _cardDecoration(),
        child: child,
      ),
    );
  }
}

// ------------------------------------------------------------------
// DECORACIÓN DE LA TARJETA (Tu Estilo Moderno)
// ------------------------------------------------------------------
BoxDecoration _cardDecoration() => BoxDecoration(
      color: Colors.white,
      // Bordes más redondeados para un estilo más moderno
      borderRadius: BorderRadius.circular(30), 
      boxShadow: const [
        BoxShadow(
          // Sombra más sutil, suave y menos oscura
          color: Color.fromRGBO(0, 0, 0, 0.12), // RGB con baja opacidad
          blurRadius: 10, 
          offset: Offset(0, 5),
        ),
      ],
    );
