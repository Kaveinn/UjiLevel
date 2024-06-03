import 'package:flutter/material.dart';
import 'package:flutter_application_widget1/models/product.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_widget1/models/shop.dart'; // Pastikan untuk mengimpor Shop

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9DDE8B), // Warna hijau
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            iconTheme: IconThemeData(
                color: Color(0xFF40A578)), // Ubah warna tanda panah
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    product.imagePath,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "rp.${product.price.toStringAsFixed(3)}",
                    style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16, color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<Shop>().addToCart(product);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product added to cart!'),
            ),
          );
        },
        label: const Text('Add to Cart'),
        icon: const Icon(Icons.shopping_cart),
        backgroundColor: Color(0xFF40A578),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
