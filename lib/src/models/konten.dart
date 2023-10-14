class Konten {
  String judul;
  String deskripsi;
  DateTime tanggal;
  Konten({
    required this.judul,
    required this.deskripsi,
    required this.tanggal,
  });

  Konten copyWith({
    String? judul,
    String? deskripsi,
    DateTime? tanggal,
  }) {
    return Konten(
      judul: judul ?? this.judul,
      deskripsi: deskripsi ?? this.deskripsi,
      tanggal: tanggal ?? this.tanggal,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'judul': judul,
      'deskripsi': deskripsi,
      'tanggal': tanggal.millisecondsSinceEpoch,
    };
  }

  factory Konten.fromMap(Map<String, dynamic> map) {
    return Konten(
      judul: map['judul'] as String,
      deskripsi: map['deskripsi'] as String,
      tanggal: DateTime.fromMillisecondsSinceEpoch(map['tanggal'] as int),
    );
  }
}
