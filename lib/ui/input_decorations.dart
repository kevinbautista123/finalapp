import 'package:flutter/material.dart';

// Clase estática para definir la decoración de todos los campos de texto
class InputDecorations {
    static InputDecoration authInputDecoration({
        required String hintText, // Reemplazamos 'hinText' por la convención 'hintText'
        required String labelText,
        IconData? prefixIcon,
    }) {
        return InputDecoration(
            // Borde cuando el campo está habilitado (Deep Orange)
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange),
            ),
            
            // Borde cuando el campo está enfocado (Deep Orange más grueso)
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange, width: 3),
            ),
            
            // Texto de ayuda (placeholder)
            hintText: hintText,
            
            // Etiqueta del campo
            labelText: labelText,
            
            // Estilo para el ícono de prefijo (Deep Orange)
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: Colors.deepOrange)
                : null,
        );
    }
}