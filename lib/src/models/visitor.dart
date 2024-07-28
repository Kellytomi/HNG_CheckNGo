import 'dart:convert';

class Visitor {
  final String fullname;
  final String phone;
  final String? email;
  final VisitorStatus status;
  final DateTime checkedAt;

  const Visitor({
    required this.fullname,
    required this.phone,
    required this.email,
    required this.status,
    required this.checkedAt,
  });

  Visitor copyWith({
    String? fullname,
    String? phone,
    String? email,
    VisitorStatus? status,
    DateTime? checkedAt,
  }) {
    return Visitor(
      fullname: fullname ?? this.fullname,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      status: status ?? this.status,
      checkedAt: checkedAt ?? this.checkedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'phone': phone,
      'email': email,
      'status': status.name,
      'checkedAt': checkedAt.toIso8601String(),
    };
  }

  factory Visitor.fromMap(Map<String, dynamic> map) {
    return Visitor(
      fullname: map['fullname'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      status: VisitorStatus.fromString(map['status'] as String),
      checkedAt: DateTime.tryParse(map['checkedAt'] as String)!,
    );
  }

  String toJson() => json.encode(toMap());

  factory Visitor.fromJson(String source) =>
      Visitor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Customer(fullname: $fullname, phone: $phone, email: $email, status: $status, checkedAt: $checkedAt)';
  }

  @override
  bool operator ==(covariant Visitor other) {
    if (identical(this, other)) return true;

    return other.phone == phone;
  }

  @override
  int get hashCode {
    return phone.hashCode;
  }
}

enum VisitorStatus {
  checkIn('in'),
  checkOut('out'),
  none('');

  final String name;
  const VisitorStatus(this.name);

  factory VisitorStatus.fromString(String data) {
    return VisitorStatus.values.firstWhere(
      (val) => val.name.toLowerCase() == data.toLowerCase(),
      orElse: () => VisitorStatus.none,
    );
  }
}
