import 'package:ecommerceapp/data/data-sources/local/sharedprefs.dart';
import 'package:ecommerceapp/presentation/login/pages/login_page.dart';
import 'package:ecommerceapp/presentation/product/bloc/bloc/product_bloc.dart';
import 'package:ecommerceapp/presentation/product/pages/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPageView extends StatelessWidget {
  const ProductsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart),
          )
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Spacer(),
              InkWell(
                onTap: () async {
                  await Sharedprefs().clear();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Container(
                  height: 50,
                  color: Colors.amber,
                  child: const Center(child: Text('Logout')),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (_, state) {
            if (state is RemoteProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is RemoteProductsError) {
              return const Center(child: Icon(Icons.refresh));
            }
            if (state is RemoteProductsLoaded) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: state.products!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                              productEntity: state.products![index])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: Column(
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxHeight: 100),
                              child: Hero(
                                tag: state.products![index].id,
                                child: Image.network(
                                  state.products![index].imgUrl,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      state.products![index].title,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "\$${state.products![index].price}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
