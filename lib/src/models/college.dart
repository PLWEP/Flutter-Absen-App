class College {
  String name;
  String nim;
  String gender;
  College({
    required this.name,
    required this.nim,
    required this.gender,
  });

  College copyWith({
    String? name,
    String? nim,
    String? gender,
  }) {
    return College(
      name: name ?? this.name,
      nim: nim ?? this.nim,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'nim': nim,
      'gender': gender,
    };
  }

  factory College.fromMap(Map<String, dynamic> map) {
    return College(
      name: map['name'] as String,
      nim: map['nim'] as String,
      gender: map['gender'] as String,
    );
  }
}
