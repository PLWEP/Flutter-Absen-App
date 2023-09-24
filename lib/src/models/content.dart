class Content {
  String title;
  String description;
  Content({
    required this.title,
    required this.description,
  });

  Content copyWith({
    String? title,
    String? description,
  }) {
    return Content(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
    };
  }

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content(
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }
}
