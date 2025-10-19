import 'package:flutter/material.dart';
// Importamos el contenedor de la cabecera con rombos.
import 'package:finalapp_kevin/widgets/login/login_container2.dart'; 

// Contenedor base que apila la cabecera (degradado + icono) y el formulario (child).
class LoginContainer1 extends StatelessWidget {
  final Widget child;
  
  const LoginContainer1({
    super.key, 
    required this.child, // El formulario de Login/Registro se pasa como hijo
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      // Fondo blanco para un diseño más limpio (en lugar de gris)
      color: Colors.white, 
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          // 1. Cabecera degradada con los rombos
          const LoginContainer2(), 
          
          // 2. Icono central
          SafeArea(
            child: Container(
              width: double.infinity,
              // Margen superior para centrar el ícono debajo del borde superior del SafeArea
              margin: const EdgeInsets.only(top: 10), 
              child: const Icon(
                // Ícono de tienda/negocio, más apropiado para una app de productos
                Icons.storefront, 
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
          
          // 3. Contenido (el formulario de Login/Registro)
          child,
        ],
      ),
    );
  }
}
