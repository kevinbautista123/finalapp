import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// 🛠️ ADAPTACIÓN: Corregida la ruta de importación para tu proyecto 'finalapp_kevin'
import 'package:finalapp_kevin/models/producto.dart'; 

class ProductService extends ChangeNotifier {
  // Configuración de la API
  final String _baseUrl = '143.198.118.203:8100';
  final String _user = 'test';
  final String _pass = 'test2023';

  // Propiedades de Estado (Mantenemos la convención de tu profesor SelectProduct)
  List<Listado> products = [];
  Listado? SelectProduct;
  bool isEditCreate = true;
  bool isLoading = true;

  ProductService() {
    // Mantenemos la llamada directa a loadProducts en el constructor
    loadProducts();
  }

  // --- OPERACIONES DE LECTURA (GET) ---
  
  Future loadProducts() async {
    isLoading = true;
    notifyListeners();
    
    final url = Uri.http(_baseUrl, 'ejemplos/product_list_rest/');
    // Mantenemos el estilo de concatenación de string del profesor
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass')); 
    
    final response = await http.get(url, headers: {'authorization': basicAuth});
    
    print(response.body); // Mantenemos el print
    
    final productMap = Product.fromJson(response.body);
    products = productMap.listado;
    
    isLoading = false;
    notifyListeners();
  }

  // --- OPERACIONES DE ESCRITURA (POST/PUT) ---
  
  // Mantenemos el nombre del método original del profesor
  Future editOrCreateProducts(Listado product) async {
    isEditCreate = true;
    notifyListeners();
    
    if (product.productId == 0) {
      await this.createProduct(product);
    } else {
      await this.updateProduct(product);
    }
    
    isEditCreate = false;
    notifyListeners();
  }

  Future updateProduct(Listado product) async {
    final url = Uri.http(_baseUrl, 'ejemplos/product_edit_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    
    final response = await http.post(
      url,
      body: product.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    
    final decodeResp = response.body;
    print(decodeResp); // Mantenemos el print
    
    //actualizamos el listado
    final index = products.indexWhere(
      (element) => element.productId == product.productId,
    );
    products[index] = product;
    
    return ""; // Mantenemos el return
  }

  Future createProduct(Listado product) async {
    final url = Uri.http(_baseUrl, 'ejemplos/product_add_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    
    final response = await http.post(
      url,
      body: product.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    
    final decodeResp = response.body;
    print(decodeResp); // Mantenemos el print
    
    //agregar al listado
    this.products.add(product);
    
    return ""; // Mantenemos el return
  }

  // --- OPERACIÓN DE ELIMINACIÓN (DELETE) ---

  Future deleteProduct(Listado product, BuildContext context) async {
    final url = Uri.http(_baseUrl, 'ejemplos/product_del_rest/');
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    
    final response = await http.post(
      url,
      body: product.toJson(),
      headers: {
        'authorization': basicAuth,
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    
    final decodeResp = response.body;
    print(decodeResp); // Mantenemos el print
    
    //elimina del listado
    // Mantenemos la lógica de borrar toda la lista y recargar
    this.products.clear(); 
    loadProducts();
    
    // Mantenemos la navegación después de la recarga
    Navigator.of(context).pushNamed('list_product'); 
    
    return ""; // Mantenemos el return
  }
}