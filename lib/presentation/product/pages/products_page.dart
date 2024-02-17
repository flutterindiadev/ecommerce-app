import 'package:ecommerceapp/injection_container.dart';
import 'package:ecommerceapp/presentation/product/bloc/bloc/product_bloc.dart';
import 'package:ecommerceapp/presentation/product/pages/products_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) => ProductBloc(sl())..add(GetProducts()),
      child: const ProductsPageView(),
    );
  }
}
