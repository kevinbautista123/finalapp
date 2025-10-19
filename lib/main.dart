import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finalapp_kevin/routes/app_routes.dart'; 
import 'package:finalapp_kevin/services/auth_service.dart'; 
import 'package:finalapp_kevin/services/product_service.dart'; 
import 'package:finalapp_kevin/themes/app_theme.dart'; 

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      
        ChangeNotifierProvider(create: (_) => AuthServices()),
        ChangeNotifierProvider(create: (_) => ProductService()),
      ],
    
      child: MainApp(), 
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Gestión de Productos', 
      
      // Rutas
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    
      theme: AppTheme.lightTheme, 
    );
  }
}