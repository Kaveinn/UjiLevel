import 'package:flutter/material.dart';
import 'package:flutter_application_widget1/components/my_partdetail.dart';
import 'package:flutter_application_widget1/components/my_product_tile.dart';
import 'package:flutter_application_widget1/components/my_sparepart_tile.dart'; // Import for SparePart tile
import 'package:flutter_application_widget1/models/shop.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShopPage(),
    );
  }
}

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 800;
    final products = context.watch<Shop>().shop; // Correct property name
    final spareParts =
        context.watch<Shop>().sparePartsList; // Correct property name

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9DDE8B),
        elevation: 1,
        foregroundColor: Colors.white,
        title: const Text("𝐇𝐨𝐦𝐞 𝐏𝐚𝐠𝐞"),
        automaticallyImplyLeading: false, // Remove leading arrow button
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushNamed(context, '/onboarding_screen');
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile_page');
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFF9DDE8B), // Change background color to blue
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment(-0.9, 0.0),
              child: Text(
                "Populer Paket",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return MyProductTile(product: product);
                },
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment(-0.9, 0.0),
              child: Text(
                "spareparts",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white, // Change text color to white
                ),
              ),
            ),
            const SizedBox(height: 14),
            Column(
              children: spareParts
                  .map((sparePart) => MyPartDetail(sparePart: sparePart))
                  .toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            if (index == 0) {
              // Reset _selectedIndex to 0 when navigating back to shop
              _selectedIndex = 0;
              Navigator.pushNamed(context, '/shop_page');
            } else if (index == 1) {
              _selectedIndex = 1;
              Navigator.pushNamed(context, '/cart_page');
            }
          });
        },
        items: _navBarItems,
        backgroundColor:
            Color(0xFF40A578), // Change bottom navigation bar color to blue
        selectedItemColor: Colors.white, // Change selected item color to white
      ),
    );
  }
}

final _navBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home_rounded),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_bag_outlined),
    activeIcon: Icon(Icons.shopping_bag),
    label: 'Cart',
  ),
];
