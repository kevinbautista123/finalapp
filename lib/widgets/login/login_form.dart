import 'package:flutter/material.dart';
import 'package:finalapp_kevin/providers/login_form_provider.dart';
import 'package:finalapp_kevin/services/auth_service.dart';  
import 'package:finalapp_kevin/ui/input_decorations.dart'; 
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  final String textButton;
  final String pathButton;
  final int loginRegister;

  const LoginForm({
    super.key,
    required this.textButton,
    required this.pathButton,
    required this.loginRegister,
  });

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final authService = Provider.of<AuthServices>(context, listen: false); 

    return Form(
      key: loginForm.formkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          
          // CAMPO DE EMAIL 
          
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'ejemplo@correo.com', 
              labelText: 'Correo electrónico', 
              prefixIcon: Icons.alternate_email,
            ),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'El valor ingresado no luce como un correo válido';
            },
          ),
          const SizedBox(height: 30),

          
          // CAMPO DE CONTRASEÑA 
          
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecorations.authInputDecoration(
              hintText: '*********',
              labelText: 'Contraseña',
              prefixIcon: Icons.lock_outline,
            ),
            
            onChanged: (value) => loginForm.password = value, 
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'La contraseña debe ser de al menos 6 caracteres';
            },
          ),
          const SizedBox(height: 30),

          
          // BOTÓN DE ACCIÓN (LOGIN / REGISTER) - Modificada 
          
          MaterialButton( 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            disabledColor: Colors.grey,
            color: Colors.deepOrange, 
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: loginForm.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      textButton,
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
            ),
            elevation: 0,
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    
                    if (!loginForm.isValidForm()) return;

                    loginForm.isLoading = true;

                    final String? errorMessage;

                    if (loginRegister == 1) { // Lógica para LOGIN
                      errorMessage = await authService.login(
                        loginForm.email,
                        loginForm.password,
                      );
                    } else { // Lógica para REGISTER
                      errorMessage = await authService.createUser(
                        loginForm.email,
                        loginForm.password,
                      );
                    }

                    if (errorMessage == null) {
                      // Éxito: Navegar a la ruta indicada (home)
                      Navigator.pushReplacementNamed(context, pathButton);
                    } else {
                      // Error: Mostrar mensaje flotante y permitir nuevo intento
                      _showErrorSnackBar(context, errorMessage);
                    }

                    loginForm.isLoading = false; // Detener la carga SIEMPRE
                  },
          ),
        ],
      ),
    );
  }
  
  // WIDGET ADICIONAL: FUNCIÓN PARA MOSTRAR EL MENSAJE FLOTANTE (SnackBar)
  void _showErrorSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      backgroundColor: Colors.red[700],
      duration: const Duration(seconds: 4),
    );
    // Asegura que el SnackBar se muestre
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}