import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthServices extends ChangeNotifier {
  // URL base de la API de Firebase Authentication
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  
  // Token de la API Key de Firebase (usada por el profesor)
  final String _firebaseToken = 'AIzaSyBnq2zDD0sLTvuLsbN2hnBEahpZKQ8uQo8'; // Usamos el token de tu compañero

  // ------------------------------------------------------------------
  // MÉTODO LOGIN
  // ------------------------------------------------------------------
  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };
    
    // Construcción de la URL segura para el endpoint signInWithPassword
    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {
      'key': _firebaseToken,
    });
    
    // Petición HTTP POST
    final response = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResponse = json.decode(response.body);
    
    // Verificación de la respuesta: Si contiene 'idToken' fue exitoso.
    if (decodeResponse.containsKey('idToken')) {
      // Éxito: retorna null
      return null;
    } else {
      // Falla: retorna el mensaje de error de Firebase
      return decodeResponse['error']['message'];
    }
  }

  // ------------------------------------------------------------------
  // MÉTODO CREAR USUARIO
  // ------------------------------------------------------------------
  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };
    
    // Construcción de la URL segura para el endpoint signUp
    final url = Uri.https(_baseUrl, '/v1/accounts:signUp', {
      'key': _firebaseToken,
    });
    
    // Petición HTTP POST
    final response = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResponse = json.decode(response.body);
    
    // Verificación de la respuesta: Si contiene 'idToken' fue exitoso.
    if (decodeResponse.containsKey('idToken')) {
      // Éxito: retorna null
      return null;
    } else {
      // Falla: retorna el mensaje de error de Firebase
      return decodeResponse['error']['message'];
    }
  }
}