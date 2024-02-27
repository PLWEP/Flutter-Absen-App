// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'konten.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KontenImpl _$$KontenImplFromJson(Map<String, dynamic> json) => _$KontenImpl(
      judul: json['judul'] as String,
      deskripsi: json['deskripsi'] as String,
      tanggal: DateTime.parse(json['tanggal'] as String),
      dokumentasi: json['dokumentasi'] as String,
    );

Map<String, dynamic> _$$KontenImplToJson(_$KontenImpl instance) =>
    <String, dynamic>{
      'judul': instance.judul,
      'deskripsi': instance.deskripsi,
      'tanggal': instance.tanggal.toIso8601String(),
      'dokumentasi': instance.dokumentasi,
    };
