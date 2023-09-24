import 'package:absen_app/src/models/college.dart';
import 'package:absen_app/src/models/content.dart';

class CourseClass {
  String id;
  String name;
  int sks;
  int totalColleges;
  List<College> colleges;
  List<Content> contents;
  CourseClass({
    required this.id,
    required this.name,
    required this.sks,
    required this.totalColleges,
    required this.colleges,
    required this.contents,
  });

  CourseClass copyWith({
    String? id,
    String? name,
    int? sks,
    int? totalColleges,
    List<College>? colleges,
    List<Content>? contents,
  }) {
    return CourseClass(
      id: id ?? this.id,
      name: name ?? this.name,
      sks: sks ?? this.sks,
      totalColleges: totalColleges ?? this.totalColleges,
      colleges: colleges ?? this.colleges,
      contents: contents ?? this.contents,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'sks': sks,
      'totalColleges': totalColleges,
      'colleges': colleges.map((x) => x.toMap()).toList(),
      'contents': contents.map((x) => x.toMap()).toList(),
    };
  }

  factory CourseClass.fromMap(Map<String, dynamic> map) {
    return CourseClass(
      id: map['id'] as String,
      name: map['name'] as String,
      sks: map['sks'] as int,
      totalColleges: map['totalColleges'] as int,
      colleges: List<College>.from(
        (map['colleges'] as List<int>).map<College>(
          (x) => College.fromMap(x as Map<String, dynamic>),
        ),
      ),
      contents: List<Content>.from(
        (map['contents'] as List<int>).map<Content>(
          (x) => Content.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

List<CourseClass> courseClasses = [
  CourseClass(
    id: "A11.4117",
    name: "Kriptografi",
    sks: 2,
    totalColleges: 5,
    colleges: [
      College(
        name: "Ahmad",
        nim: "A11.2020.00001",
        gender: "Male",
      ),
      College(
        name: "Rendi",
        nim: "A11.2020.00002",
        gender: "Male",
      ),
      College(
        name: "Renji",
        nim: "A11.2020.00003",
        gender: "Male",
      ),
      College(
        name: "Kiko",
        nim: "A11.2020.00004",
        gender: "Female",
      ),
      College(
        name: "Rahmad",
        nim: "A11.2020.00005",
        gender: "Male",
      ),
    ],
    contents: [
      Content(
        title: "Pertemuan 1",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 2",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 3",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 4",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 5",
        description: "Kontrak Kuliah",
      ),
    ],
  ),
  CourseClass(
    id: "A11.4117",
    name: "Metodologi Penelitian",
    sks: 2,
    totalColleges: 5,
    colleges: [
      College(
        name: "Ahmad",
        nim: "A11.2020.00001",
        gender: "Male",
      ),
      College(
        name: "Rendi",
        nim: "A11.2020.00002",
        gender: "Male",
      ),
      College(
        name: "Renji",
        nim: "A11.2020.00003",
        gender: "Male",
      ),
      College(
        name: "Kiko",
        nim: "A11.2020.00004",
        gender: "Female",
      ),
      College(
        name: "Rahmad",
        nim: "A11.2020.00005",
        gender: "Male",
      ),
    ],
    contents: [
      Content(
        title: "Pertemuan 1",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 2",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 3",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 4",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 5",
        description: "Kontrak Kuliah",
      ),
    ],
  ),
  CourseClass(
    id: "A11.4117",
    name: "Kecerdasan Buatan",
    sks: 2,
    totalColleges: 5,
    colleges: [
      College(
        name: "Ahmad",
        nim: "A11.2020.00001",
        gender: "Male",
      ),
      College(
        name: "Rendi",
        nim: "A11.2020.00002",
        gender: "Male",
      ),
      College(
        name: "Renji",
        nim: "A11.2020.00003",
        gender: "Male",
      ),
      College(
        name: "Kiko",
        nim: "A11.2020.00004",
        gender: "Female",
      ),
      College(
        name: "Rahmad",
        nim: "A11.2020.00005",
        gender: "Male",
      ),
    ],
    contents: [
      Content(
        title: "Pertemuan 1",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 2",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 3",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 4",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 5",
        description: "Kontrak Kuliah",
      ),
    ],
  ),
  CourseClass(
    id: "A11.4117",
    name: "Komputer Grafik",
    sks: 2,
    totalColleges: 5,
    colleges: [
      College(
        name: "Ahmad",
        nim: "A11.2020.00001",
        gender: "Male",
      ),
      College(
        name: "Rendi",
        nim: "A11.2020.00002",
        gender: "Male",
      ),
      College(
        name: "Renji",
        nim: "A11.2020.00003",
        gender: "Male",
      ),
      College(
        name: "Kiko",
        nim: "A11.2020.00004",
        gender: "Female",
      ),
      College(
        name: "Rahmad",
        nim: "A11.2020.00005",
        gender: "Male",
      ),
    ],
    contents: [
      Content(
        title: "Pertemuan 1",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 2",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 3",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 4",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 5",
        description: "Kontrak Kuliah",
      ),
    ],
  ),
  CourseClass(
    id: "A11.4117",
    name: "Pemrogramman Web Dasar",
    sks: 2,
    totalColleges: 5,
    colleges: [
      College(
        name: "Ahmad",
        nim: "A11.2020.00001",
        gender: "Male",
      ),
      College(
        name: "Rendi",
        nim: "A11.2020.00002",
        gender: "Male",
      ),
      College(
        name: "Renji",
        nim: "A11.2020.00003",
        gender: "Male",
      ),
      College(
        name: "Kiko",
        nim: "A11.2020.00004",
        gender: "Female",
      ),
      College(
        name: "Rahmad",
        nim: "A11.2020.00005",
        gender: "Male",
      ),
    ],
    contents: [
      Content(
        title: "Pertemuan 1",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 2",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 3",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 4",
        description: "Kontrak Kuliah",
      ),
      Content(
        title: "Pertemuan 5",
        description: "Kontrak Kuliah",
      ),
    ],
  ),
];
