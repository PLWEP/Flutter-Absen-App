class CourseClass {
  String id;
  String name;
  int sks;
  int totalColleges;
  CourseClass({
    required this.id,
    required this.name,
    required this.sks,
    required this.totalColleges,
  });

  CourseClass copyWith({
    String? id,
    String? name,
    int? sks,
    int? totalColleges,
  }) {
    return CourseClass(
      id: id ?? this.id,
      name: name ?? this.name,
      sks: sks ?? this.sks,
      totalColleges: totalColleges ?? this.totalColleges,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'sks': sks,
      'total_colleges': totalColleges,
    };
  }

  factory CourseClass.fromMap(Map<String, dynamic> map) {
    return CourseClass(
      id: map['id'] as String,
      name: map['name'] as String,
      sks: map['sks'] as int,
      totalColleges: map['total_colleges'] as int,
    );
  }
}

List<CourseClass> courseClasses = [
  CourseClass(
    id: "A11.4117",
    name: "Kriptografi",
    sks: 2,
    totalColleges: 35,
  ),
  CourseClass(
    id: "A11.4117",
    name: "Metodologi Penelitian",
    sks: 2,
    totalColleges: 35,
  ),
  CourseClass(
    id: "A11.4117",
    name: "Kecerdasan Buatan",
    sks: 2,
    totalColleges: 35,
  ),
  CourseClass(
    id: "A11.4117",
    name: "Komputer Grafik",
    sks: 2,
    totalColleges: 35,
  ),
  CourseClass(
    id: "A11.4117",
    name: "Pemrogramman Web Dasar",
    sks: 2,
    totalColleges: 35,
  ),
];
