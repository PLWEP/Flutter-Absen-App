import 'package:absen_app/src/models/konten.dart';
import 'package:absen_app/src/models/mahasiswa.dart';

class MataKuliah {
  String id;
  String name;
  String dosen;
  String jadwal;
  int sks;
  int jumlahMahasiswa;
  List<Mahasiswa> daftarMahasiswa;
  List<Konten> konten;
  MataKuliah({
    required this.id,
    required this.name,
    required this.dosen,
    required this.jadwal,
    required this.sks,
    required this.jumlahMahasiswa,
    required this.daftarMahasiswa,
    required this.konten,
  });

  MataKuliah copyWith({
    String? id,
    String? name,
    String? dosen,
    String? jadwal,
    int? sks,
    int? jumlahMahasiswa,
    List<Mahasiswa>? daftarMahasiswa,
    List<Konten>? konten,
  }) {
    return MataKuliah(
      id: id ?? this.id,
      name: name ?? this.name,
      dosen: dosen ?? this.dosen,
      jadwal: jadwal ?? this.jadwal,
      sks: sks ?? this.sks,
      jumlahMahasiswa: jumlahMahasiswa ?? this.jumlahMahasiswa,
      daftarMahasiswa: daftarMahasiswa ?? this.daftarMahasiswa,
      konten: konten ?? this.konten,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'sks': sks,
      'jumlahMahasiswa': jumlahMahasiswa,
      'daftarMahasiswa': daftarMahasiswa.map((x) => x.toMap()).toList(),
      'konten': konten.map((x) => x.toMap()).toList(),
    };
  }

  factory MataKuliah.fromMap(Map<String, dynamic> map) {
    return MataKuliah(
      id: map['id'] as String,
      name: map['name'] as String,
      dosen: map['dosen'] as String,
      jadwal: map['jadwal'] as String,
      sks: map['sks'] as int,
      jumlahMahasiswa: map['jumlahMahasiswa'] as int,
      daftarMahasiswa: List<Mahasiswa>.from(
        (map['daftarMahasiswa'] as List<int>).map<Mahasiswa>(
          (x) => Mahasiswa.fromMap(x as Map<String, dynamic>),
        ),
      ),
      konten: List<Konten>.from(
        (map['konten'] as List<int>).map<Konten>(
          (x) => Konten.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
