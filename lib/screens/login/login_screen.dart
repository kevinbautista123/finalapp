import 'package:flutter/material.dart';
import 'package:finalapp_kevin/widgets/widgets.dart'; 

// Esta es la pantalla principal que muestra la cabecera (LoginContainer1) 
// y el formulario de acceso.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usamos el contenedor base que maneja el fondo y el ícono
      body: LoginContainer1(
        // El 'child' es el formulario de login que aparecerá centrado en la tarjeta
        child: const LoginAreaForm(
          // Título principal del formulario
          textTile: 'Acceso a tu Cuenta',
          // Texto del botón principal
          textButton: 'Iniciar Sesión',
          // Ruta de navegación al presionar el botón de acceso exitoso
          pathButton: 'home', 
          // Indica el tipo de formulario: 1 para Login, 0 para Registro (si lo usas)
          loginRegister: 1, 
          // Texto para el botón de navegación secundario (Registro)
          textFinalButton: '¿No tienes una cuenta? Regístrate aquí.',
          // Ruta de navegación al presionar el botón secundario
          path: 'register',
        ),
      ),
    );
  }
}
