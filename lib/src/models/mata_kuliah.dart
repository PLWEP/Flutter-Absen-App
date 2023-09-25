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

List<MataKuliah> daftarMataKuliah = [
  MataKuliah(
    id: "A11.1234",
    name: "Kriptografi",
    sks: 3,
    jumlahMahasiswa: 5,
    daftarMahasiswa: [
      Mahasiswa(nama: "Ahmad", nim: "A11.2020.00001", jenisKelamin: "Male"),
      Mahasiswa(nama: "Budi", nim: "A11.2020.00002", jenisKelamin: "Male"),
      Mahasiswa(nama: "Citra", nim: "A11.2020.00003", jenisKelamin: "Female"),
      Mahasiswa(nama: "Dewi", nim: "A11.2020.00004", jenisKelamin: "Female"),
      Mahasiswa(nama: "Eka", nim: "A11.2020.00005", jenisKelamin: "Male"),
    ],
    konten: [
      Konten(judul: "Pertemuan 1", deskripsi: "Kontrak Kuliah"),
      Konten(judul: "Pertemuan 2", deskripsi: "Enkripsi dan Dekripsi"),
      Konten(judul: "Pertemuan 3", deskripsi: "Algoritma Kriptografi"),
      Konten(judul: "Pertemuan 4", deskripsi: "Keamanan Komunikasi"),
      Konten(judul: "Pertemuan 5", deskripsi: "Tugas Mingguan"),
      Konten(judul: "Pertemuan 6", deskripsi: "Kriptografi Simetris"),
      Konten(judul: "Pertemuan 7", deskripsi: "Kriptografi Asimetris"),
      Konten(judul: "Pertemuan 8", deskripsi: "Sertifikat Digital"),
      Konten(judul: "Pertemuan 9", deskripsi: "Kriptografi Kunci Publik"),
      Konten(judul: "Pertemuan 10", deskripsi: "Protokol Keamanan"),
      Konten(judul: "Pertemuan 11", deskripsi: "Keamanan Jaringan"),
      Konten(judul: "Pertemuan 12", deskripsi: "Implementasi Kriptografi"),
      Konten(judul: "Pertemuan 13", deskripsi: "Evaluasi Akhir"),
      Konten(judul: "Pertemuan 14", deskripsi: "Review Materi"),
    ],
  ),
  MataKuliah(
    id: "A11.5678",
    name: "Pemrograman Lanjut",
    sks: 4,
    jumlahMahasiswa: 8,
    daftarMahasiswa: [
      Mahasiswa(nama: "Fani", nim: "A11.2020.00006", jenisKelamin: "Female"),
      Mahasiswa(nama: "Guntur", nim: "A11.2020.00007", jenisKelamin: "Male"),
      Mahasiswa(nama: "Hani", nim: "A11.2020.00008", jenisKelamin: "Female"),
      Mahasiswa(nama: "Ahmad", nim: "A11.2020.00001", jenisKelamin: "Male"),
      Mahasiswa(nama: "Budi", nim: "A11.2020.00002", jenisKelamin: "Male"),
      Mahasiswa(nama: "Citra", nim: "A11.2020.00003", jenisKelamin: "Female"),
      Mahasiswa(nama: "Dewi", nim: "A11.2020.00004", jenisKelamin: "Female"),
      Mahasiswa(nama: "Eka", nim: "A11.2020.00005", jenisKelamin: "Male"),
    ],
    konten: [
      Konten(judul: "Pertemuan 1", deskripsi: "Pendahuluan Pemrograman Lanjut"),
      Konten(judul: "Pertemuan 2", deskripsi: "Struktur Data Lanjut"),
    ],
  ),
];
