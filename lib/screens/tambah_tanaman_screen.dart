import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class TambahTanamanScreen extends StatefulWidget {
  final Map<String, dynamic>? tanaman;

  const TambahTanamanScreen({
    super.key,
    this.tanaman,
  });

  @override
  State<TambahTanamanScreen> createState() =>
      _TambahTanamanScreenState();
}

class _TambahTanamanScreenState
    extends State<TambahTanamanScreen> {

  final namaController =
      TextEditingController();

  final jadwalSiramController =
      TextEditingController();

  final jadwalPupukController =
      TextEditingController();

  final catatanController =
      TextEditingController();

  String kategori = "Tanaman Hias";

  @override
  void initState() {
    super.initState();

    if (widget.tanaman != null) {
      namaController.text =
          widget.tanaman!["nama"] ?? "";

      kategori =
          widget.tanaman!["kategori"] ??
              "Tanaman Hias";

      jadwalSiramController.text =
          widget.tanaman!["jadwal_siram"] ?? "";

      jadwalPupukController.text =
          widget.tanaman!["jadwal_pupuk"] ?? "";

      catatanController.text =
          widget.tanaman!["catatan"] ?? "";
    }
  }

  Future<void> simpanTanaman() async {
    try {
      final data = {
        "nama": namaController.text,
        "kategori": kategori,
        "gambar": "",
        "jadwal_siram":
            jadwalSiramController.text,
        "jadwal_pupuk":
            jadwalPupukController.text,
        "catatan":
            catatanController.text,
      };

      if (widget.tanaman == null) {
        await DBHelper.insertTanaman(data);
      } else {
        await DBHelper.updateTanaman(
          data,
          widget.tanaman!["id"],
        );
      }

      if (!mounted) return;

      Navigator.pop(context);

    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.tanaman == null
              ? "Tambah Tanaman"
              : "Edit Tanaman",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: namaController,
              decoration:
                  const InputDecoration(
                labelText: "Nama Tanaman",
              ),
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField<String>(
              value: kategori,
              decoration:
                  const InputDecoration(
                labelText: "Kategori",
              ),
              items: const [
                DropdownMenuItem(
                  value: "Tanaman Hias",
                  child:
                      Text("Tanaman Hias"),
                ),
                DropdownMenuItem(
                  value: "Sayuran",
                  child: Text("Sayuran"),
                ),
                DropdownMenuItem(
                  value: "Buah",
                  child: Text("Buah"),
                ),
                DropdownMenuItem(
                  value: "Tanaman Obat",
                  child:
                      Text("Tanaman Obat"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  kategori = value!;
                });
              },
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
                  jadwalSiramController,
              decoration:
                  const InputDecoration(
                labelText:
                    "Jadwal Penyiraman",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
                  jadwalPupukController,
              decoration:
                  const InputDecoration(
                labelText:
                    "Jadwal Pemupukan",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
                  catatanController,
              maxLines: 3,
              decoration:
                  const InputDecoration(
                labelText: "Catatan",
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    simpanTanaman,
                child: Text(
                  widget.tanaman == null
                      ? "Simpan"
                      : "Update",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}