class Activity {
  final String id;
  final String uid;
  final String title;
  final String description;
  final DateTime date;
  final String documentation;

  Activity({
    required this.id,
    required this.uid,
    required this.title,
    required this.description,
    required this.date,
    required this.documentation,
  });

  Activity copyWith({
    String? id,
    String? uid,
    String? title,
    String? description,
    DateTime? date,
    String? documentation,
  }) {
    return Activity(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      documentation: documentation ?? this.documentation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uid': uid,
      'title': title,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'documentation': documentation,
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      id: map['id'] as String,
      uid: map['uid'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      documentation: map['documentation'] as String,
    );
  }

  @override
  String toString() {
    return 'Activity(id: $id, uid: $uid, title: $title, description: $description, date: $date, documentation: $documentation)';
  }

  @override
  bool operator ==(covariant Activity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.uid == uid &&
        other.title == title &&
        other.description == description &&
        other.date == date &&
        other.documentation == documentation;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uid.hashCode ^
        title.hashCode ^
        description.hashCode ^
        date.hashCode ^
        documentation.hashCode;
  }
}
