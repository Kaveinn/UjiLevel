import 'package:flutter/material.dart';
import 'package:flutter_application_widget1/models/product.dart';
import 'package:flutter_application_widget1/models/sparepart.dart';

class Shop extends ChangeNotifier {
  // Define the list of products
  List<Product> products = [
    Product(
      name: "Paket Bore up nanggung",
      price: 750, // Prices should be in integer format without commas
      description:
          "solusi sempurna untuk meningkatkan performa mesin tanpa mengorbankan efisiensi. Hadirkan kemampuan ekstra pada kendaraan Anda dengan harga yang terjangkau!",
      imagePath: 'lib/images/mesin.png',
    ),
    Product(
      name: "Paket Bore up Ga nanggung",
      price: 900,
      description:
          "Lebih dari sekadar pembaruan, Paket Bore Up ga nanggung menghadirkan kekuatan yang Anda butuhkan. Segera miliki untuk pengalaman berkendara yang tak tertandingi!",
      imagePath: 'lib/images/nduggal.jpg',
    ),
    Product(
      name: "Tune up",
      price: 300,
      description:
          "Perawatan kunci untuk performa mesin yang andal. Tawarkan kendaraan Anda keahlian perawatan yang layak dengan harga terbaik. Pesan sekarang dan nikmati kinerja maksimal!",
      imagePath: 'lib/images/yahu.jpg',
    ),
    Product(
      name: "Paket kirian",
      price: 500,
      description:
          "Dengan Paket CVT Ngacir, kendaraan Anda akan merasakan loncatan kinerja yang signifikan. Nikmati perjalanan tanpa hambatan dengan transmisi yang dioptimalkan. Pesan sekarang dan rasakan perbedaannya!",
      imagePath: 'lib/images/haloo.jpg',
    ),
  ];

  // Define the list of spare parts
  List<SparePart> spareParts = [
    SparePart(
      name: "Air Filter",
      description: "High quality air filter for various models.",
      price: 200,
      imagePath: 'lib/images/mesin.png',
    ),
    SparePart(
      name: "Oil Filter",
      description: "Reliable oil filter for improved engine performance.",
      price: 150,
      imagePath: 'lib/images/mesin.png',
    ),
  ];

  // User cart
  List<Product> _cart = [];

  // Get product list
  List<Product> get shop => products;
  

  // Get spare parts list
  List<SparePart> get sparePartsList => spareParts;

  // Get user cart
  List<Product> get cart => _cart;

  // Add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // Remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }

    void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
