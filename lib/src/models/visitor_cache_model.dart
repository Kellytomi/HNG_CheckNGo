import 'package:isar/isar.dart';

import 'visitor.dart';

part 'visitor_cache_model.g.dart';

@collection
class VisitorCacheModel {
  VisitorCacheModel({
    required this.fullname,
    required this.phone,
    required this.email,
    required this.checkedInAt,
    required this.checkedOutAt,
    required this.visitReason,
  }) : id = Isar.autoIncrement;

  late Id id;

  late String fullname;

  @Index()
  late String phone;

  late String? email;

  late String? visitReason;

  @Index(unique: true, replace: true)
  late DateTime checkedInAt;

  @Index()
  late DateTime? checkedOutAt;

  factory VisitorCacheModel.fromVisitor(Visitor visitor) => VisitorCacheModel(
        fullname: visitor.fullname,
        phone: visitor.phone,
        email: visitor.email,
        visitReason: visitor.visitReason,
        checkedInAt: visitor.checkedInAt,
        checkedOutAt: visitor.checkedOutAt,
      );

  Visitor toVisitor() => Visitor(
        fullname: fullname,
        phone: phone,
        email: email,
        visitReason: visitReason,
        checkedInAt: checkedInAt,
        checkedOutAt: checkedOutAt,
      );
}
