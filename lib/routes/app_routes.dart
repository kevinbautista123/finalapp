import 'package:flutter/material.dart';

import '../screens/loading_screen.dart';
import '../screens/error_screen.dart';
import '../screens/login/register_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login/login_screen.dart';

import '../screens/products/edit_product_screen.dart'; 
import '../screens/products/list_product_screen.dart';


class AppRoutes {
    // Establece la ruta inicial a 'login' (como en tu archivo original)
    static const initialRoute = 'login'; 

    // Mapa de todas las rutas de la aplicación
    static Map<String, Widget Function(BuildContext)> routes = {
        //  1. RUTAS DE AUTENTICACIÓN Y FLUJO 
        'login': (BuildContext context) => const LoginScreen(),
        'register': (BuildContext context) => const RegisterScreen(),
        
        //  2. VISTA PRINCIPAL 
        'home': (BuildContext context) => const HomeScreen(),
        
        //  3. MÓDULO PRODUCTOS 
        'list_product': (BuildContext context) => const ListProductScreen(),
        
        // apuntando a tu clase existente 'EditProductScreen'.
        'create_product': (BuildContext context) => const EditProductScreen(), 
        'edit_product': (BuildContext context) => const EditProductScreen(),
        
        //  4. UTILIDADES 
        'loading': (BuildContext context) => const LoadingScreen(),
        'error': (BuildContext context) => const ErrorScreen(),
    };

    // Función que se llama si la aplicación intenta navegar a una ruta que no existe.
    static Route<dynamic> onGenerateRoute(RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => const ErrorScreen());
    }
}
