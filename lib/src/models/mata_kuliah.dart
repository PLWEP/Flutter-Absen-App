import 'package:absen_app/src/models/konten.dart';
import 'package:absen_app/src/models/mahasiswa.dart';

class MataKuliah {
  String id;
  String name;
  int sks;
  int jumlahMahasiswa;
  List<Mahasiswa> daftarMahasiswa;
  List<Konten> konten;
  MataKuliah({
    required this.id,
    required this.name,
    required this.sks,
    required this.jumlahMahasiswa,
    required this.daftarMahasiswa,
    required this.konten,
  });

  MataKuliah copyWith({
    String? id,
    String? name,
    int? sks,
    int? jumlahMahasiswa,
    List<Mahasiswa>? daftarMahasiswa,
    List<Konten>? konten,
  }) {
    return MataKuliah(
      id: id ?? this.id,
      name: name ?? this.name,
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

List<MataKuliah> courseClasses = [
  MataKuliah(
    id: "A11.4117",
    name: "Kriptografi",
    sks: 2,
    jumlahMahasiswa: 5,
    daftarMahasiswa: [
      Mahasiswa(
        nama: "Ahmad",
        nim: "A11.2020.00001",
        jenisKelamin: "Male",
      ),
      Mahasiswa(
        nama: "Rendi",
        nim: "A11.2020.00002",
        jenisKelamin: "Male",
      ),
      Mahasiswa(
        nama: "Renji",
        nim: "A11.2020.00003",
        jenisKelamin: "Male",
      ),
      Mahasiswa(
        nama: "Kiko",
        nim: "A11.2020.00004",
        jenisKelamin: "Female",
      ),
      Mahasiswa(
        nama: "Rahmad",
        nim: "A11.2020.00005",
        jenisKelamin: "Male",
      ),
    ],
    konten: [
      Konten(
        judul: "Pertemuan 1",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 2",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 3",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 4",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 5",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
    ],
  ),
  MataKuliah(
    id: "A11.4117",
    name: "Metodologi Penelitian",
    sks: 2,
    jumlahMahasiswa: 5,
    daftarMahasiswa: [
      Mahasiswa(
        nama: "Ahmad",
        nim: "A11.2020.00001",
        jenisKelamin: "Male",
      ),
      Mahasiswa(
        nama: "Rendi",
        nim: "A11.2020.00002",
        jenisKelamin: "Male",
      ),
      Mahasiswa(
        nama: "Renji",
        nim: "A11.2020.00003",
        jenisKelamin: "Male",
      ),
      Mahasiswa(
        nama: "Kiko",
        nim: "A11.2020.00004",
        jenisKelamin: "Female",
      ),
      Mahasiswa(
        nama: "Rahmad",
        nim: "A11.2020.00005",
        jenisKelamin: "Male",
      ),
    ],
    konten: [
      Konten(
        judul: "Pertemuan 1",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 2",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 3",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 4",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 5",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
    ],
  ),
  MataKuliah(
    id: "A11.4117",
    name: "Kecerdasan Buatan",
    sks: 2,
    jumlahMahasiswa: 5,
    daftarMahasiswa: [
      Mahasiswa(
        nama: "Ahmad",
        nim: "A11.2020.00001",
        jenisKelamin: "Male",
      ),
      Mahasiswa(
        nama: "Rendi",
        nim: "A11.2020.00002",
        jenisKelamin: "Male",
      ),
      Mahasiswa(
        nama: "Renji",
        nim: "A11.2020.00003",
        jenisKelamin: "Male",
      ),
      Mahasiswa(
        nama: "Kiko",
        nim: "A11.2020.00004",
        jenisKelamin: "Female",
      ),
      Mahasiswa(
        nama: "Rahmad",
        nim: "A11.2020.00005",
        jenisKelamin: "Male",
      ),
    ],
    konten: [
      Konten(
        judul: "Pertemuan 1",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 2",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 3",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 4",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 5",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
    ],
  ),
  MataKuliah(
    id: "A11.4117",
    name: "Komputer Grafik",
    sks: 2,
    jumlahMahasiswa: 5,
    daftarMahasiswa: [
      Mahasiswa(
        nama: "Ahmad",
        nim: "A11.2020.00001",
        jenisKelamin: "Male",
      ),
      Mahasiswa(
        nama: "Rendi",
        nim: "A11.2020.00002",
        jenisKelamin: "Male",
      ),
      Mahasiswa(
        nama: "Renji",
        nim: "A11.2020.00003",
        jenisKelamin: "Male",
      ),
      Mahasiswa(
        nama: "Kiko",
        nim: "A11.2020.00004",
        jenisKelamin: "Female",
      ),
      Mahasiswa(
        nama: "Rahmad",
        nim: "A11.2020.00005",
        jenisKelamin: "Male",
      ),
    ],
    konten: [
      Konten(
        judul: "Pertemuan 1",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 2",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 3",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 4",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 5",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
    ],
  ),
  MataKuliah(
    id: "A11.4117",
    name: "Pemrogramman Web Dasar",
    sks: 2,
    jumlahMahasiswa: 5,
    daftarMahasiswa: [
      Mahasiswa(
        nama: "Ahmad",
        nim: "A11.2020.00001",
        jenisKelamin: "Male",
      ),
      Mahasiswa(
        nama: "Rendi",
        nim: "A11.2020.00002",
        jenisKelamin: "Male",
      ),
      Mahasiswa(
        nama: "Renji",
        nim: "A11.2020.00003",
        jenisKelamin: "Male",
      ),
      Mahasiswa(
        nama: "Kiko",
        nim: "A11.2020.00004",
        jenisKelamin: "Female",
      ),
      Mahasiswa(
        nama: "Rahmad",
        nim: "A11.2020.00005",
        jenisKelamin: "Male",
      ),
    ],
    konten: [
      Konten(
        judul: "Pertemuan 1",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 2",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 3",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 4",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
      Konten(
        judul: "Pertemuan 5",
        subJudul: "Pertemuan 1",
        deskripsi: "Kontrak Kuliah",
      ),
    ],
  ),
];
