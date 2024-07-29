import 'package:checkngo/src/models/visitor.dart';
import 'package:checkngo/src/services/admin_service.dart';
import 'package:checkngo/src/services/nfc_service.dart';

class VisitorsService {
  final AdminService adminService;
  final NFCService nfcService;
  const VisitorsService({required this.adminService, required this.nfcService});

  Future<void> checkIn({
    required String name,
    required String phone,
    required String? email,
  }) async {
    final admin = await adminService.getAdmin();

    final visitor = Visitor(
      adminID: admin.email,
      fullname: name,
      phone: phone,
      email: email,
      status: VisitorStatus.checkIn,
      checkedAt: DateTime.now(),
    );

    try {
      // first write to the NFC tag
      // and then call _DBsetStatus() to send the data to Firebase
      await nfcService.writeTag(visitor.toJson());
      await _DBsetStatus(visitor);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> checkOut() async {
    try {
      // Get the visitor by reading from the NFC tag,
      // change the status to checkOut
      // and then call _DBsetStatus() to send the data to Firebase
      late Visitor visitor;
      await nfcService.readTag((payload) {
        visitor =
            Visitor.fromJson(payload).copyWith(status: VisitorStatus.checkOut);
      });
      await _DBsetStatus(visitor);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<Visitor>> getVisitors() {
    return Stream.value(_mockVisitors);
  }

  Future<void> _DBsetStatus(Visitor visitor) async {}
}

final _mockVisitors = [
  Visitor(
    adminID: 'admin@gmail.com',
    fullname: 'asf ba',
    phone: '+234543453245',
    email: 'a@a.com',
    status: VisitorStatus.checkIn,
    checkedAt: DateTime.now(),
  ),
  Visitor(
    adminID: 'admin@gmail.com',
    fullname: 'Qasf ba',
    phone: '+234653445',
    email: 'a@b.com',
    status: VisitorStatus.checkIn,
    checkedAt: DateTime.now(),
  ),
  Visitor(
    adminID: 'admin@gmail.com',
    fullname: 'Qasf ba',
    phone: '+234653445',
    email: 'a@b.com',
    status: VisitorStatus.checkOut,
    checkedAt: DateTime.now(),
  ),
  Visitor(
    adminID: 'admin@gmail.com',
    fullname: 'asf ba',
    phone: '+234543453245',
    email: 'a@a.com',
    status: VisitorStatus.checkOut,
    checkedAt: DateTime.now(),
  ),
  Visitor(
    adminID: 'admin@gmail.com',
    fullname: 'Bbas ba',
    phone: '+23494349053',
    email: 'a@d.com',
    status: VisitorStatus.checkIn,
    checkedAt: DateTime.now(),
  ),
  Visitor(
    adminID: 'admin@gmail.com',
    fullname: 'Bbas ba',
    phone: '+23494349053',
    email: 'a@d.com',
    status: VisitorStatus.checkOut,
    checkedAt: DateTime.now(),
  ),
];
