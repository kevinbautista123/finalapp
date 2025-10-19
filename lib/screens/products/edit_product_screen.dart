import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 🛠️ ADAPTACIÓN: Corregidas las rutas de importación para tu proyecto 'finalapp_kevin'
import 'package:finalapp_kevin/providers/product_form_provider.dart';
import 'package:finalapp_kevin/services/product_service.dart';
import 'package:finalapp_kevin/widgets/widgets.dart';

class EditProductScreen extends StatelessWidget {
   const EditProductScreen({super.key});
   
   @override
   Widget build(BuildContext context) {
      final productService = Provider.of<ProductService>(context);

    // ⚠️ Mantenemos la lógica de la mayúscula 'SelectProduct' como en el ProductService del profesor
    // y usamos '.copy()' para no modificar directamente el objeto en el servicio.
      return ChangeNotifierProvider(
         create: (_) => ProductFormProvider(productService.SelectProduct!.copy()), 
         child: _ProductScreenBody(productService: productService),
      );
   }
}

class _ProductScreenBody extends StatelessWidget {
   final ProductService productService;
   
   const _ProductScreenBody({super.key, required this.productService});
   
   @override
   Widget build(BuildContext context) {
      final productForm = Provider.of<ProductFormProvider>(context);

      return Scaffold(
         body: SingleChildScrollView(
            child: Column(
               children: [
                  Stack(
                     children: [
                // ⚠️ Mantenemos la referencia a 'SelectProduct' para la imagen del Stack
                        ImageProduct(url: productService.SelectProduct!.productImage),
                        Positioned(
                           top: 40,
                           left: 20,
                           child: IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(
                                 Icons.arrow_back_ios,
                                 size: 40,
                                 color: Colors.black,
                              ),
                           ),
                        ),
                     ],
                  ),
                  const SizedBox(height: 10),
                  const FormProduct(),
               ],
            ),
         ),
         
         // FABs
         floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               // Botón Eliminar
               FloatingActionButton(
                  child: const Icon(Icons.delete_forever),
                  onPressed: () async {
                     // Mantenemos la validación del formulario antes de eliminar, aunque no es estrictamente necesaria.
                     if (!productForm.isValidForm()) return; 
                     
                     await productService.deleteProduct(productForm.product, context);
                  },
                  heroTag: null,
               ),
               
               const SizedBox(width: 20),
               
               // Botón Guardar
               FloatingActionButton(
                  child: const Icon(Icons.save),
                  onPressed: () async {
                     if (!productForm.isValidForm()) return;
                     
                     // ⚠️ Mantenemos el método del profesor 'editOrCreateProducts'
                     await productService.editOrCreateProducts(productForm.product); 
                  },
                  heroTag: null,
               ),
            ],
         ),
      );
   }
}