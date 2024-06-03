import 'package:flutter/material.dart';
import 'package:flutter_application_widget1/models/sparepart.dart';

class MyPartDetail extends StatelessWidget {
  final SparePart sparePart;

  const MyPartDetail({required this.sparePart, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Color(0xFF40A578), // Mengatur warna card menjadi hijau tua
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sparePart.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              sparePart.description,
              style: TextStyle(
                fontSize: 14,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Rp.${sparePart.price.toStringAsFixed(3)}",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol dipencet
              },
              child: Text(
                'add to cart',
                style: TextStyle(
                  color: Colors.black, // Mengatur warna teks menjadi hitam
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
