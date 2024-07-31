import 'dart:convert';
import 'dart:ui';

import 'package:checkngo/src/utils/colors.dart';

class Visitor {
  final String fullname;
  final String phone;
  final String? email;
  final DateTime checkedInAt;
  final DateTime? checkedOutAt;
  final String? visitReason;

  const Visitor({
    required this.fullname,
    required this.phone,
    required this.checkedInAt,
    this.email,
    this.checkedOutAt,
    this.visitReason,
  });

  VisitorStatus get status {
    if (checkedOutAt == null) {
      return VisitorStatus.checkIn;
    }
    return VisitorStatus.checkOut;
  }

  bool get isCheckedOut => checkedOutAt != null;

  Visitor copyWith({
    String? fullname,
    String? phone,
    String? email,
    DateTime? checkedInAt,
    DateTime? checkedOutAt,
    String? visitReason,
  }) {
    return Visitor(
      fullname: fullname ?? this.fullname,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      checkedInAt: checkedInAt ?? this.checkedInAt,
      checkedOutAt: checkedOutAt,
      visitReason: visitReason ?? this.visitReason,
    );
  }

  List<Object?> toCsvRow() {
    return [
      fullname,
      phone,
      email,
      checkedInAt,
      checkedOutAt,
      visitReason,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'phone': phone,
      'email': email,
      'checkedInAt': checkedInAt.toIso8601String(),
      'checkedOutAt': checkedOutAt?.toIso8601String(),
      'visitReason': visitReason,
    };
  }

  factory Visitor.fromMap(Map<String, dynamic> map) {
    return Visitor(
      fullname: map['fullname'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      visitReason: map['visitReason'] as String,
      checkedInAt: DateTime.tryParse(map['checkedInAt'] as String)!,
      checkedOutAt: DateTime.tryParse(map['checkedOutAt'] as String)!,
    );
  }

  String toJson() => json.encode(toMap());

  factory Visitor.fromJson(String source) =>
      Visitor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Customer(fullname: $fullname, phone: $phone, email: $email, visitReason: $visitReason, checkedInAt: $checkedInAt, checkedOutAt: $checkedOutAt)';
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

extension StatusColor on VisitorStatus {
  Color get color {
    return switch (this) {
      VisitorStatus.checkIn => kGreenColor,
      _ => kRedColor,
    };
  }
}
