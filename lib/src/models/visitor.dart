import 'dart:convert';

class Visitor {
  final String id;
  final String fullname;
  final String phone;
  final String email;
  final DateTime createdAt;

  const Visitor({
    required this.id,
    required this.fullname,
    required this.phone,
    required this.email,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullname': fullname,
      'phone': phone,
      'email': email,
      'createdAt': createdAt,
    };
  }

  factory Visitor.fromMap(Map<String, dynamic> map) {
    return Visitor(
      id: map['id'] as String,
      fullname: map['fullname'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      createdAt: DateTime.tryParse(map['createdAt'] as String)!,
    );
  }

  String toJson() => json.encode(toMap());

  factory Visitor.fromJson(String source) =>
      Visitor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Customer(id: $id, fullname: $fullname, phone: $phone, email: $email, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Visitor other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.fullname == fullname &&
        other.phone == phone &&
        other.email == email &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullname.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        createdAt.hashCode;
  }
}
