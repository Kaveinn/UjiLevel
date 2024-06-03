import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_widget1/models/product.dart';
import 'package:flutter_application_widget1/models/shop.dart';
import 'package:flutter_application_widget1/components/my_detail_product.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Shop()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return MyProductTile(product: product);
        },
      ),
    );
  }
}

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: 140,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Color(0xFF40A578), // Change card color to green
          child: InkWell(
            onTap: () {
              // Aksi ketika card dipencet, bisa navigasi ke halaman detail produk
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    product.imagePath,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Ubah warna teks menjadi putih
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "rp.${product.price.toStringAsFixed(3)}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white, // Ubah warna teks menjadi putih
                        ),
                      ),
                      SizedBox(height: 4),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Aksi ketika tombol detail dipencet
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailPage(product: product),
                              ),
                            );
                          },
                          child: Text(
                            "Details",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white, // Ubah warna tombol menjadi putih
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
