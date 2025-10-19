import 'package:flutter/material.dart';

// Definimos la clase que contendrá nuestro tema de aplicación
class AppTheme {
    // Definición de nuestro color primario para toda la aplicación
    static const Color primary = Colors.deepOrange;
    
    // El objeto ThemeData que define la apariencia de la app
    static final ThemeData lightTheme = ThemeData.light().copyWith(
        // Color principal de la aplicación
        primaryColor: primary,
        
        // Configuración visual de la AppBar
        appBarTheme: const AppBarTheme(
            color: primary,
            elevation: 5, // Un poco de sombra para destacar
            foregroundColor: Colors.white, // Título e iconos en blanco
        ),

        // Configuración de los botones de texto
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: primary, // Color primario para el texto
            ),
        ),
        
        // Configuración de los Floating Action Buttons
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: primary,
            elevation: 8,
        ),
        
        // Configuración general para los inputs de texto (TextFormField)
        inputDecorationTheme: const InputDecorationTheme(
            // Borde en color primario cuando está habilitado
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primary),
            ),
            // Borde más grueso en color primario cuando está enfocado
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primary, width: 2),
            ),
            // Estilo para el texto de la etiqueta
            labelStyle: TextStyle(color: primary),
            // Borde general
            border: OutlineInputBorder(),
        ),
    );
}