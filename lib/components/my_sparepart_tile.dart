import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_widget1/models/sparepart.dart';
import 'package:flutter_application_widget1/models/shop.dart';
import 'package:flutter_application_widget1/components/my_partdetail.dart';

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
      title: 'Spare Part List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SparePartListPage(),
    );
  }
}

class SparePartListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final spareParts = context.watch<Shop>().sparePartsList;

    return Scaffold(
      appBar: AppBar(
        title: Text('Spare Part List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: spareParts.map((sparePart) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: MySparePartTile(sparePart: sparePart),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class MySparePartTile extends StatelessWidget {
  final SparePart sparePart;

  const MySparePartTile({required this.sparePart, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // Set the width of each card
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Color(0xFF40A578), // Change card color to green
        child: InkWell(
          onTap: () {
            // Aksi ketika card dipencet, bisa navigasi ke halaman detail suku cadang
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyPartDetail(sparePart: sparePart),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  sparePart.imagePath,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sparePart.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Ubah warna teks menjadi putih
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "idr.${sparePart.price.toStringAsFixed(3)}",
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
                                  MyPartDetail(sparePart: sparePart),
                            ),
                          );
                        },
                        child: Text(
                          "Details",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary:
                              Colors.white, // Ubah warna tombol menjadi putih
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
    );
  }
}
