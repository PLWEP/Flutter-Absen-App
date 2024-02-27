import 'package:freezed_annotation/freezed_annotation.dart';

part 'konten.freezed.dart';
part 'konten.g.dart';

@freezed
class Konten with _$Konten {
  factory Konten({
    required String judul,
    required String deskripsi,
    required DateTime tanggal,
    required String dokumentasi,
  }) = _Konten;

  factory Konten.fromJson(Map<String, dynamic> json) => _$KontenFromJson(json);
}
