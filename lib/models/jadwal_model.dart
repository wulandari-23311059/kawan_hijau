class JadwalModel {
  final int? id;
  final String tanaman;
  final String kegiatan;
  final String tanggal;

  JadwalModel({
    this.id,
    required this.tanaman,
    required this.kegiatan,
    required this.tanggal,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tanaman': tanaman,
      'kegiatan': kegiatan,
      'tanggal': tanggal,
    };
  }
}