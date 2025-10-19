import 'package:flutter/material.dart';
// ¡CORREGIDO! Importamos los widgets desde la ruta de tu proyecto
import 'package:finalapp_kevin/widgets/widgets.dart'; 

// Esta es la pantalla que permite a los usuarios crear una nueva cuenta.
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Utilizamos el contenedor base (LoginContainer1) que ya incluye la cabecera
      body: LoginContainer1(
        // El 'child' es el formulario de registro que aparecerá centrado en la tarjeta
        child: const LoginAreaForm(
          // Título principal del formulario
          textTile: 'Crear Nueva Cuenta',
          // Texto del botón principal
          textButton: 'Registrar',
          // Ruta de navegación después de un registro exitoso (debe ir a Home o Login)
          pathButton: 'home', 
          // Indica el tipo de formulario: 2 para Registro (usaremos 0 para Login en otros casos, pero 2 funciona)
          loginRegister: 2, 
          // Texto para el botón de navegación secundario (Acceso)
          textFinalButton: '¿Ya tienes una cuenta? Accede aquí.',
          // Ruta de navegación al presionar el botón secundario
          path: 'login',
        ),
      ),
    );
  }
}