import 'dart:async';

import 'package:flutter_feed/logic/viewmodel/product_view_model.dart';
import 'package:flutter_feed/model/product.dart';


class ProductBloc {
  final ProductViewModel productViewModel = ProductViewModel(productsItems: []);
  final productController = StreamController<List<Product>>();
  Stream<List<Product>> get productItems => productController.stream;

  ProductBloc() {
    productController.add(productViewModel.getProducts());
  }
}
