import 'dart:async';

import '../../model/product.dart';
import '../viewmodel/product_view_model.dart';



class ProductBloc {
  final ProductViewModel productViewModel = ProductViewModel(productsItems: []);
  final productController = StreamController<List<Product>>();
  Stream<List<Product>> get productItems => productController.stream;

  ProductBloc() {
    productController.add(productViewModel.getProducts());
  }
}
