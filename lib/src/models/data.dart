import 'package:absen_app/src/models/mahasiswa.dart';
import 'package:absen_app/src/models/konten.dart';
import 'package:absen_app/src/models/mata_kuliah.dart';

List<MataKuliah> daftarMataKuliah = [
  MataKuliah(
    id: "A11.1234",
    name: "Kriptografi",
    dosen: "Dr. Prof. Patrick",
    jadwal: "Senin, 08.00 - 10.00",
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
    dosen: "Dr. Prof. Patrick",
    jadwal: "Senin, 08.00 - 10.00",
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
