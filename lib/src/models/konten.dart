class Konten {
  String judul;
  String deskripsi;
  DateTime tanggal;
  String dokumentasi;
  Konten({
    required this.judul,
    required this.deskripsi,
    required this.tanggal,
    required this.dokumentasi,
  });

  Konten copyWith({
    String? judul,
    String? deskripsi,
    DateTime? tanggal,
    String? dokumentasi,
  }) {
    return Konten(
      judul: judul ?? this.judul,
      deskripsi: deskripsi ?? this.deskripsi,
      tanggal: tanggal ?? this.tanggal,
      dokumentasi: dokumentasi ?? this.dokumentasi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'judul': judul,
      'deskripsi': deskripsi,
      'tanggal': tanggal.millisecondsSinceEpoch,
      'dokumentasi': dokumentasi,
    };
  }

  factory Konten.fromMap(Map<String, dynamic> map) {
    return Konten(
      judul: map['judul'] as String,
      deskripsi: map['deskripsi'] as String,
      tanggal: DateTime.fromMillisecondsSinceEpoch(map['tanggal'] as int),
      dokumentasi: map['dokumentasi'] as String,
    );
  }
}
