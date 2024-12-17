import 'package:fakestore_flutter_bloc/fakesore_screen/bloc/fakestore_bloc.dart';
import 'package:fakestore_flutter_bloc/fakesore_screen/bloc/fakestore_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FakestoreScreen extends StatelessWidget {
  const FakestoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Listing'),
      ),
      body: BlocBuilder<FakestoreBloc, FakestoreState>(
        builder: (context, state) {
          if (state is FakestoreLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FakestoreSuccessState) {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: state.productsList.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  imageUrl: state.productsList[index].image.toString(),
                  title: state.productsList[index].title.toString(),
                  description: state.productsList[index].description.toString(),
                  price: state.productsList[index].price.toString(),
                );
              },
            );
          }
          if (state is FakestoreExceptionState ||
              state is FakestoreFailedState) {
            const Center(
              child: Text("Failed to fetc products"),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
