import 'package:checkngo/src/models/visitor.dart';

class VisitorsService {
  Future<void> createVisitor({
    required String name,
    required String phone,
    required String email,
  }) async {}

  Stream<List<Visitor>> getVisitors() {
    return Stream.value(_mockVisitors);
  }
}

final _mockVisitors = [
  Visitor(
    id: '1',
    fullname: 'asf ba',
    phone: '+234543453245',
    email: 'a@a.com',
    createdAt: DateTime.now(),
  ),
  Visitor(
    id: '2',
    fullname: 'Qasf ba',
    phone: '+234653445',
    email: 'a@b.com',
    createdAt: DateTime.now(),
  ),
  Visitor(
    id: '3',
    fullname: 'Uyasd ba',
    phone: '+23427453645',
    email: 'a@c.com',
    createdAt: DateTime.now(),
  ),
  Visitor(
    id: '4',
    fullname: 'Bbas ba',
    phone: '+23494349053',
    email: 'a@d.com',
    createdAt: DateTime.now(),
  ),
];
