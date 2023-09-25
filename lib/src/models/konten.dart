class Konten {
  String judul;
  String deskripsi;
  Konten({
    required this.judul,
    required this.deskripsi,
  });

  Konten copyWith({
    String? judul,
    String? subJudul,
    String? deskripsi,
  }) {
    return Konten(
      judul: judul ?? this.judul,
      deskripsi: deskripsi ?? this.deskripsi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'judul': judul,
      'deskripsi': deskripsi,
    };
  }

  factory Konten.fromMap(Map<String, dynamic> map) {
    return Konten(
      judul: map['judul'] as String,
      deskripsi: map['deskripsi'] as String,
    );
  }
}
