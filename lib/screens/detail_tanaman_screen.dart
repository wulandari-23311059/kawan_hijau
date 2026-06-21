import 'package:flutter/material.dart';

class DetailTanamanScreen extends StatelessWidget {
  final String nama;
  final String kategori;

  const DetailTanamanScreen({
    super.key,
    required this.nama,
    required this.kategori,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nama),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.eco,
              size: 100,
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            Text(
              nama,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              kategori,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}