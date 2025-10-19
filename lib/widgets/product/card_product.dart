import 'package:flutter/material.dart';

// 🛠️ ADAPTACIÓN: Corregidas las rutas de importación para tu proyecto 'finalapp_kevin'
import 'package:finalapp_kevin/widgets/product/detail_product.dart';
import 'package:finalapp_kevin/widgets/product/image_product.dart';
import 'package:finalapp_kevin/widgets/product/price_product.dart';
import 'package:finalapp_kevin/models/producto.dart'; // Asumo que tu modelo se importa así

class CardProduct extends StatelessWidget {
  final Listado product;
  const CardProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 10),
        width: double.infinity,
        decoration: _cardDecorations(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            ImageProduct(url: product.productImage),
            // ⚠️ ESTA LÍNEA CAUSARÁ UN ERROR DE COMPILACIÓN:
            // The named parameter 'productId' is required
            DetailProduct(productName: product.productName), 
            Positioned(
              top: 0,
              right: 0,
              child: PriceProduct(productPrice: product.productPrice),
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _cardDecorations() => BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(25),
  boxShadow: const [
    BoxShadow(color: Colors.black, offset: Offset(0, 5), blurRadius: 10),
  ],
);