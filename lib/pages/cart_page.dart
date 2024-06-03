import 'package:flutter/material.dart';
import 'package:flutter_application_widget1/models/product.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  // remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    // show a dialog box to ask user to confirm to remove cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart? "),
        actions: [
          // cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          // yes button
          MaterialButton(
            onPressed: () {
              // pop dialog box
              Navigator.pop(context);

              // remove from cart
              context.read<Shop>().removeFromCart(product);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9DDE8B), // Background color green
        elevation: 1,
        foregroundColor: Colors.white,
        title: const Text("𝐂𝐚𝐫𝐭 𝐏𝐚𝐠𝐞"),
        automaticallyImplyLeading: false, // Remove leading arrow button
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile_page');
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFF9DDE8B), // Background color green
      body: Column(
        children: [
          // cart list
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                // get individual item in cart
                final item = cart[index];

                // return as a cart tile UI
                return ListTile(
                  leading: Image.asset(
                    item.imagePath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(3)),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => removeItemFromCart(context, item),
                  ),
                );
              },
            ),
          ),

          // pay button dengan padding di atasnya
          Padding(
            padding: EdgeInsets.only(top: 19, bottom: 19),
            child: TextButton.icon(
              onPressed: () {
                // Tambahkan logika untuk melakukan pembayaran di sini
                // Misalnya, menampilkan dialog konfirmasi pembayaran atau
                // melakukan proses pembayaran sesuai dengan logika aplikasi Anda
                // Setelah pembayaran selesai, Anda bisa membersihkan keranjang belanja
                // dan melakukan navigasi ke halaman lain seperti halaman konfirmasi pembayaran
                // atau halaman utama.

                // Misalnya, untuk membersihkan keranjang:
                context.read<Shop>().clearCart();

                // Dan untuk melakukan navigasi:
                Navigator.pushNamed(context, '/payment_confirmation_page');
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF40A578), // Warna tombol
                padding: EdgeInsets.symmetric(
                    vertical: 16, horizontal: 32), // Padding tombol
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)), // Bentuk tombol
              ),
              icon:
                  Icon(Icons.payment, color: Colors.white), // Ikon untuk tombol
              label: Text('Pay Now',
                  style: TextStyle(
                      color: Colors.white, fontSize: 18)), // Teks tombol
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // index dari 'Cart' pada bottom navigation bar
        backgroundColor: Color(0xFF40A578), // Warna hijau tua
        selectedItemColor: Colors.white, // Warna teks item yang dipilih
        unselectedItemColor:
            const Color.fromARGB(179, 68, 68, 68), // Warna teks item yang tidak dipilih
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        onTap: (int index) {
          // Tambahkan logika untuk menangani ketika item bottom navigation bar ditekan
          // Misalnya, bisa dengan navigator ke halaman lain
          if (index == 0) {
            // Pindahkan ke halaman Home
            Navigator.pushNamed(context, '/shop_page');
          } else if (index == 2) {
            // Pindahkan ke halaman Profile
            Navigator.pushNamed(context, '/profile_page');
          }
        },
      ),
    );
  }
}
