import 'package:flutter/material.dart';

// La clase extiende ChangeNotifier para poder notificar a los widgets cuando cambie el estado.
class LoginFormProvider extends ChangeNotifier {
    
    // GlobalKey para identificar el widget Form y acceder a sus métodos.
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    // Variables que almacenarán los valores de los campos de texto del formulario.
    String email = '';
    String password = ''; 

    // ----------------------------------------------------
    // GESTIÓN DEL ESTADO DE CARGA (Loading)
    // ----------------------------------------------------

    // Variable privada para controlar si se está enviando la petición a la API.
    bool _isLoading = false;

    // Getter público para acceder al estado de carga.
    bool get isLoading => _isLoading;

    // Setter que actualiza el estado de carga y notifica a los widgets.
    set isLoading(bool value) {
        _isLoading = value;
    }

    // ----------------------------------------------------
    // VALIDACIÓN DEL FORMULARIO
    // ----------------------------------------------------

    // Método para validar que todos los campos del formulario cumplen sus reglas.
    bool isValidForm() {
        // Accede al estado actual del formulario usando la formkey y llama a validate().
        // Si formkey.currentState es nulo, devuelve false.
        return formkey.currentState?.validate() ?? false;
    }
}