import 'package:flutter/material.dart';

class TanamanCard extends StatelessWidget {
  final String nama;
  final String kategori;
  final VoidCallback onTap;

  const TanamanCard({
    super.key,
    required this.nama,
    required this.kategori,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,

        leading: const CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(
            Icons.eco,
            color: Colors.white,
          ),
        ),

        title: Text(nama),

        subtitle: Text(kategori),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
      ),
    );
  }
}