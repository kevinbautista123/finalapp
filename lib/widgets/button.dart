import 'package:flutter/material.dart';

// Widget de botón reutilizable para acciones principales, manteniendo el nombre simple.
class Button extends StatelessWidget {
  final String textButton;
  final String pathButton;
  
  const Button({
    super.key, 
    required this.pathButton, 
    required this.textButton,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // Usamos un color de contraste llamativo (Naranja) para la acción principal
          disabledColor: Colors.blueGrey,
          color: Colors.deepOrange, // Estilo de tu proyecto
          elevation: 8, 
          // Acción del botón: Navegar a la ruta especificada
          onPressed: () => Navigator.pushNamed(context, pathButton), 
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15), 
            child: Text(
              textButton, 
              style: const TextStyle(
                color: Colors.white, 
                fontSize: 18, 
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}