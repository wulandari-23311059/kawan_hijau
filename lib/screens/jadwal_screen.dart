import 'package:flutter/material.dart';

class JadwalScreen extends StatefulWidget {
  const JadwalScreen({super.key});

  @override
  State<JadwalScreen> createState() =>
      _JadwalScreenState();
}

class _JadwalScreenState
    extends State<JadwalScreen> {

  final List<Map<String, dynamic>> jadwal = [
    {
      "tanaman": "Monstera",
      "kegiatan": "Penyiraman",
      "tanggal": "Hari Ini",
      "selesai": false,
    },
    {
      "tanaman": "Cabai",
      "kegiatan": "Pemupukan",
      "tanggal": "Besok",
      "selesai": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jadwal"),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: jadwal.length,

        itemBuilder: (context, index) {

          final item = jadwal[index];

          return Card(
            margin:
                const EdgeInsets.only(
              bottom: 15,
            ),

            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    item["selesai"]
                        ? Colors.green
                        : Colors.orange,

                child: Icon(
                  item["selesai"]
                      ? Icons.check
                      : Icons.water_drop,
                  color: Colors.white,
                ),
              ),

              title: Text(
                item["tanaman"],
              ),

              subtitle: Text(
                "${item["kegiatan"]} • ${item["tanggal"]}",
              ),
            ),
          );
        },
      ),
    );
  }
}