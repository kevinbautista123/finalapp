import 'package:flutter/material.dart';
import 'package:finalapp_kevin/providers/login_form_provider.dart';
import 'package:finalapp_kevin/widgets/widgets.dart';
import 'package:provider/provider.dart';

// Este widget es la tarjeta blanca que contiene el formulario.
// Recibe los textos y rutas para ser reutilizable en Login y Register.
class LoginAreaForm extends StatelessWidget {
  final String textTile;
  final String textButton;
  final String pathButton;
  final int loginRegister;
  final String textFinalButton;
  final String path;
  
  const LoginAreaForm({
    super.key,
    required this.textTile,
    required this.textButton,
    required this.pathButton,
    required this.loginRegister,
    required this.textFinalButton,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    // Usamos MediaQuery para determinar la posición adecuada del formulario
    final sizeScreen = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          // 1. ESPACIADO INTELIGENTE (Mejora de Responsividad)
          // Altura dinámica para empujar el CardContainer por debajo del ícono de la cabecera.
          // Se calcula como la altura de la cabecera (0.4) menos la mitad del icono (50) para centrarlo.
          SizedBox(height: sizeScreen.height * 0.4 - 50), 
          
          CardContainer(
            child: Column(
              children: [
                const SizedBox(height: 10),
                // Título de la tarjeta (Iniciar Sesión / Crear Cuenta)
                Text(
                  textTile,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w600, // Estilo mejorado
                  ),
                ),
                const SizedBox(height: 30),
                
                // 2. FORMULARIO REAL (LoginForm)
                ChangeNotifierProvider(
                  create: (_) => LoginFormProvider(),
                  child: LoginForm( 
                    textButton: textButton,
                    pathButton: pathButton,
                    loginRegister: loginRegister,
                  ),
                ),

                const SizedBox(height: 15),

                // 3. OPCIÓN DE RECUPERAR CONTRASEÑA (NUEVO)
                TextButton(
                  onPressed: () {
                    // Navegación a la ruta de recuperación de contraseña
                    Navigator.pushNamed(context, 'forgot-password'); 
                  },
                  child: const Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(
                      fontSize: 14, 
                      color: Colors.blueGrey, // Color sutil
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                
                // 4. BOTÓN FINAL para navegar entre Login y Registro
                TextButton(
                  onPressed: () {
                    // Usamos pushReplacementNamed para evitar acumular pantallas
                    Navigator.pushReplacementNamed(context, path); 
                  },
                  style: ButtonStyle(
                    // Estilo limpio
                    overlayColor: WidgetStateProperty.all(Colors.blue.withOpacity(0.1)),
                    shape: WidgetStateProperty.all(const StadiumBorder()),
                  ),
                  child: Text(
                    textFinalButton,
                    style: const TextStyle(
                      fontSize: 16, // Tamaño ligeramente más pequeño
                      fontWeight: FontWeight.normal, 
                      color: Colors.black54, // Color discreto
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          // Espacio extra en la parte inferior de la pantalla para desplazamiento
          const SizedBox(height: 50), 
        ],
      ),
    );
  }
}