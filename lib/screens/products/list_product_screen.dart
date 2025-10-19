import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:finalapp_kevin/models/producto.dart'; 
import 'package:finalapp_kevin/screens/loading_screen.dart'; 
import 'package:finalapp_kevin/widgets/product/card_product.dart'; 
import 'package:finalapp_kevin/services/product_service.dart'; 

class ListProductScreen extends StatelessWidget {
  const ListProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    if (productService.isLoading) return LoadingScreen(); 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Productos'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            // SelectProduct (P mayúscula) está correcto según tu Service.
            productService.SelectProduct = productService.products[index]
                .copy();
            Navigator.pushNamed(context, 'edit_product');
          },
          child: CardProduct(product: productService.products[index] as Listado),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          productService.SelectProduct = Listado(
            productId: 0,
            productName: '',
            productPrice: 0,
            productImage:
                'https://abravidro.org.br/wp-content/uploads/2015/04/sem-imagem4.jpg', 
            productState: '',
          );
          Navigator.pushNamed(context, 'edit_product');
        },
      ),
    );
  }
}