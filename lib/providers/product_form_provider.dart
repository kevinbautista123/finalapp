import 'package:finalapp_kevin/models/producto.dart';
import 'package:flutter/material.dart';

class ProductFormProvider extends ChangeNotifier {
  // GlobalKey para identificar el widget Form y acceder a sus métodos.
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  
  // La instancia del producto que se está editando o creando
  Listado product; 
  
  // Recibe la instancia del producto al ser creado
  ProductFormProvider(this.product);

  // Método para validar que todos los campos del formulario cumplen sus reglas.
  bool isValidForm() {
    // Accede al estado actual del formulario usando la formkey.
    return formkey.currentState?.validate() ?? false;
  }
}