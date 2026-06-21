class TanamanModel {
  final int? id;
  final String nama;
  final String kategori;

  TanamanModel({
    this.id,
    required this.nama,
    required this.kategori,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'kategori': kategori,
    };
  }
}