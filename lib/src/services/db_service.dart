import 'dart:io';

import 'package:checkngo/src/models/visitor.dart';
import 'package:checkngo/src/models/visitor_cache_model.dart';
import 'package:csv/csv.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DBService {
  final Isar isar;
  DBService(this.isar);

  Future<void> save(Visitor visitor) async {
    await isar.writeTxn(() async {
      await isar.visitorCacheModels.put(
        VisitorCacheModel.fromVisitor(visitor),
      );
    });
  }

  Future<Visitor> getVisitor(String phone) async {
    final found =
        await isar.visitorCacheModels.filter().phoneEqualTo(phone).findFirst();
    if (found == null) {
      throw Exception('Could not find the visitor with the given phone number');
    }

    return found.toVisitor();
  }

  Future<List<Visitor>> getVisitors(SortVisitorBy sort) async {
    final qBuilder = isar.visitorCacheModels.where();
    final list = await switch (sort) {
      SortVisitorBy.checkedIn => qBuilder.sortByCheckedInAtDesc().findAll(),
      SortVisitorBy.checkedOut => qBuilder.sortByCheckedOutAtDesc().findAll(),
    };
    return List.generate(list.length, (i) {
      return list[i].toVisitor();
    });
  }

  String toCSV(List<Visitor> visitors) {
    var csvData = [
      [
        'Full Name',
        'Phone Number',
        'Email',
        'Checked-in Time',
        'Checked-out Time',
        'Visit Reason'
      ], // Headers
      ...visitors.map((visitor) => visitor.toCsvRow()),
    ];
    return const ListToCsvConverter().convert(csvData);
  }

  Future<void> saveCsvFile(List<Visitor> visitors) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/visitors-logs.csv';
    final file = File(path);

    await file.writeAsString(toCSV(visitors));
  }
}

enum SortVisitorBy { checkedIn, checkedOut }
