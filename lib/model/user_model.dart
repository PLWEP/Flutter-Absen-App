class UserModel {
  final String name;
  final String profilePic;
  final String uid;

  UserModel({
    required this.name,
    required this.profilePic,
    required this.uid,
  });

  UserModel copyWith({
    String? name,
    String? profilePic,
    String? uid,
  }) =>
      UserModel(
        name: name ?? this.name,
        profilePic: profilePic ?? this.profilePic,
        uid: uid ?? this.uid,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'profilePic': profilePic,
        'uid': uid,
      };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        name: map['name'] as String,
        profilePic: map['profilePic'] as String,
        uid: map['uid'] as String,
      );
}
