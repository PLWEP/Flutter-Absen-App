class Mahasiswa {
  String nama;
  String nim;
  String jenisKelamin;
  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.jenisKelamin,
  });

  Mahasiswa copyWith({
    String? nama,
    String? nim,
    String? jenisKelamin,
  }) {
    return Mahasiswa(
      nama: nama ?? this.nama,
      nim: nim ?? this.nim,
      jenisKelamin: jenisKelamin ?? this.jenisKelamin,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'nim': nim,
      'jenisKelamin': jenisKelamin,
    };
  }

  factory Mahasiswa.fromMap(Map<String, dynamic> map) {
    return Mahasiswa(
      nama: map['nama'] as String,
      nim: map['nim'] as String,
      jenisKelamin: map['jenisKelamin'] as String,
    );
  }
}
