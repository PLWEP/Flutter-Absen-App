// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'konten.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Konten _$KontenFromJson(Map<String, dynamic> json) {
  return _Konten.fromJson(json);
}

/// @nodoc
mixin _$Konten {
  String get judul => throw _privateConstructorUsedError;
  String get deskripsi => throw _privateConstructorUsedError;
  DateTime get tanggal => throw _privateConstructorUsedError;
  String get dokumentasi => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KontenCopyWith<Konten> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KontenCopyWith<$Res> {
  factory $KontenCopyWith(Konten value, $Res Function(Konten) then) =
      _$KontenCopyWithImpl<$Res, Konten>;
  @useResult
  $Res call(
      {String judul, String deskripsi, DateTime tanggal, String dokumentasi});
}

/// @nodoc
class _$KontenCopyWithImpl<$Res, $Val extends Konten>
    implements $KontenCopyWith<$Res> {
  _$KontenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? judul = null,
    Object? deskripsi = null,
    Object? tanggal = null,
    Object? dokumentasi = null,
  }) {
    return _then(_value.copyWith(
      judul: null == judul
          ? _value.judul
          : judul // ignore: cast_nullable_to_non_nullable
              as String,
      deskripsi: null == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dokumentasi: null == dokumentasi
          ? _value.dokumentasi
          : dokumentasi // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KontenImplCopyWith<$Res> implements $KontenCopyWith<$Res> {
  factory _$$KontenImplCopyWith(
          _$KontenImpl value, $Res Function(_$KontenImpl) then) =
      __$$KontenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String judul, String deskripsi, DateTime tanggal, String dokumentasi});
}

/// @nodoc
class __$$KontenImplCopyWithImpl<$Res>
    extends _$KontenCopyWithImpl<$Res, _$KontenImpl>
    implements _$$KontenImplCopyWith<$Res> {
  __$$KontenImplCopyWithImpl(
      _$KontenImpl _value, $Res Function(_$KontenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? judul = null,
    Object? deskripsi = null,
    Object? tanggal = null,
    Object? dokumentasi = null,
  }) {
    return _then(_$KontenImpl(
      judul: null == judul
          ? _value.judul
          : judul // ignore: cast_nullable_to_non_nullable
              as String,
      deskripsi: null == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String,
      tanggal: null == tanggal
          ? _value.tanggal
          : tanggal // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dokumentasi: null == dokumentasi
          ? _value.dokumentasi
          : dokumentasi // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KontenImpl implements _Konten {
  _$KontenImpl(
      {required this.judul,
      required this.deskripsi,
      required this.tanggal,
      required this.dokumentasi});

  factory _$KontenImpl.fromJson(Map<String, dynamic> json) =>
      _$$KontenImplFromJson(json);

  @override
  final String judul;
  @override
  final String deskripsi;
  @override
  final DateTime tanggal;
  @override
  final String dokumentasi;

  @override
  String toString() {
    return 'Konten(judul: $judul, deskripsi: $deskripsi, tanggal: $tanggal, dokumentasi: $dokumentasi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KontenImpl &&
            (identical(other.judul, judul) || other.judul == judul) &&
            (identical(other.deskripsi, deskripsi) ||
                other.deskripsi == deskripsi) &&
            (identical(other.tanggal, tanggal) || other.tanggal == tanggal) &&
            (identical(other.dokumentasi, dokumentasi) ||
                other.dokumentasi == dokumentasi));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, judul, deskripsi, tanggal, dokumentasi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KontenImplCopyWith<_$KontenImpl> get copyWith =>
      __$$KontenImplCopyWithImpl<_$KontenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KontenImplToJson(
      this,
    );
  }
}

abstract class _Konten implements Konten {
  factory _Konten(
      {required final String judul,
      required final String deskripsi,
      required final DateTime tanggal,
      required final String dokumentasi}) = _$KontenImpl;

  factory _Konten.fromJson(Map<String, dynamic> json) = _$KontenImpl.fromJson;

  @override
  String get judul;
  @override
  String get deskripsi;
  @override
  DateTime get tanggal;
  @override
  String get dokumentasi;
  @override
  @JsonKey(ignore: true)
  _$$KontenImplCopyWith<_$KontenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
