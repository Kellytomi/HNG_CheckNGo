import 'package:checkngo/src/models/visitor.dart';
import 'package:checkngo/src/services/db_service.dart';
import 'package:checkngo/src/services/nfc_service.dart';

class VisitorsService {
  final NFCService nfcService;
  final DBService dbService;

  const VisitorsService({required this.nfcService, required this.dbService});

  Future<void> checkIn({
    required String name,
    required String phone,
    String email = '',
    String? visitReason,
  }) async {
    final visitor = Visitor(
      fullname: name,
      phone: phone,
      email: email.isEmpty ? null : email,
      checkedInAt: DateTime.now(),
      visitReason: visitReason,
    );

    try {
      // Write to the NFC tag and ensure this process completes before proceeding
      await nfcService.writeTag(phone);
      // Only after successful NFC write, save the visitor data to the local DB
      await dbService.save(visitor);
    } catch (e) {
      print('Error during check-in: $e');
      throw e;
    }
  }

  Future<void> checkOut() async {
  try {
    String? phone;
    await nfcService.readTag((payload) {
      if (payload.startsWith("Failed")) {
        throw Exception(payload);
      }
      phone = payload;
    });

    // Ensure phone is not null
    if (phone == null || phone!.isEmpty) {
      throw Exception('Failed to read NFC tag.');
    }

    final visitor = await dbService.getVisitor(phone!);
    if (visitor.checkedOutAt != null) {
      throw Exception('Visitor already checked out');
    }

    await dbService.save(visitor.copyWith(checkedOutAt: DateTime.now()));
  } catch (e) {
    print('Error during check-out: $e');
    throw e;
  }
}


  Future<List<Visitor>> getVisitors(SortVisitorBy sort) async {
    final visitors = await dbService.getVisitors(sort);
    return visitors;
  }

  Future<void> saveAsCSV(List<Visitor> visitors) {
    return dbService.saveCsvFile(visitors);
  }
}
