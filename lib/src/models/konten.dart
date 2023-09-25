class Konten {
  String judul;
  String subJudul;
  String deskripsi;
  Konten({
    required this.judul,
    required this.subJudul,
    required this.deskripsi,
  });

  Konten copyWith({
    String? judul,
    String? subJudul,
    String? deskripsi,
  }) {
    return Konten(
      judul: judul ?? this.judul,
      subJudul: subJudul ?? this.subJudul,
      deskripsi: deskripsi ?? this.deskripsi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'judul': judul,
      'subJudul': subJudul,
      'deskripsi': deskripsi,
    };
  }

  factory Konten.fromMap(Map<String, dynamic> map) {
    return Konten(
      judul: map['judul'] as String,
      subJudul: map['subJudul'] as String,
      deskripsi: map['deskripsi'] as String,
    );
  }
}
