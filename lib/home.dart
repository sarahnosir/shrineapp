import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shrine_app/supplemental/asymmetric_view.dart';
import 'model/product.dart';
import 'model/products_repository.dart';

class HomePage extends StatelessWidget {
  final Category category;

  const HomePage({this.category = Category.all, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AsymmetricView(
      products: ProductsRepository.loadProducts(Category.all),
    );
  }
}
