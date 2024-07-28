import 'dart:convert';

class Admin {
  final String id;
  final String email;
  final String orgName;
  const Admin({
    required this.id,
    required this.email,
    required this.orgName,
  });

  Admin copyWith({
    String? id,
    String? email,
    String? orgName,
  }) {
    return Admin(
      id: id ?? this.id,
      email: email ?? this.email,
      orgName: orgName ?? this.orgName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'orgName': orgName,
    };
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      id: map['id'] as String,
      email: map['email'] as String,
      orgName: map['orgName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Admin.fromJson(String source) =>
      Admin.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Admin(id: $id, email: $email, orgName: $orgName)';

  @override
  bool operator ==(covariant Admin other) {
    if (identical(this, other)) return true;

    return other.id == id && other.email == email && other.orgName == orgName;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ orgName.hashCode;
}
