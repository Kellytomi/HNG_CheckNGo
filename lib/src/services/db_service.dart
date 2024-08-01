import 'dart:convert';
import 'dart:io';

import 'package:checkngo/src/models/visitor.dart';
import 'package:checkngo/src/models/visitor_cache_model.dart';
import 'package:checkngo/src/utils/custom_exception.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DBService {
  final Isar isar;
  DBService(this.isar) {
    // final list = [
    //   Visitor(
    //     fullname: 'Jamiu Jimoh',
    //     phone: '0627987492',
    //     checkedInAt: DateTime.now(),
    //     visitReason: 'Something something',
    //   ),
    //   Visitor(
    //     fullname: 'Jamiu Jimoh',
    //     phone: '0627987492',
    //     checkedInAt: DateTime.now(),
    //     checkedOutAt: DateTime.now(),
    //     visitReason: 'Something something',
    //   ),
    //
    //   Visitor(
    //     fullname: 'Jamiu Jimoh',
    //     phone: '7627987492',
    //     checkedInAt: DateTime.now(),
    //     visitReason: 'Something something',
    //   ),
    //
    //   Visitor(
    //     fullname: 'Jamiu Jimoh',
    //     phone: '1627077492',
    //     checkedInAt: DateTime.now(),
    //     visitReason: 'Something something',
    //   ),
    //
    //   Visitor(
    //     fullname: 'Jamiu Jimoh',
    //     phone: '8647987492',
    //     checkedInAt: DateTime.now(),
    //     visitReason: 'Something something',
    //   ),
    //
    //   Visitor(
    //     fullname: 'Jamiu Jimoh',
    //     phone: '9097987492',
    //     checkedInAt: DateTime.now(),
    //     visitReason: 'Something something',
    //   ),
    //
    //   Visitor(
    //     fullname: 'Jamiu Jimoh',
    //     phone: '1644987492',
    //     checkedInAt: DateTime.now(),
    //     visitReason: 'Something something',
    //   ),
    //   Visitor(
    //     fullname: 'Jamiu Jimoh',
    //     phone: '1644987492',
    //     checkedInAt: DateTime.now(),
    //     checkedOutAt: DateTime.now(),
    //     visitReason: 'Something something',
    //   ),
    //   Visitor(
    //     fullname: 'Jamiu Jimoh',
    //     phone: '1627987492',
    //     checkedInAt: DateTime.now(),
    //     visitReason: 'Something something',
    //   ),
    //   Visitor(
    //     fullname: 'Jamiu Jimoh',
    //     phone: '3627987292',
    //     checkedInAt: DateTime.now(),
    //     visitReason: 'Something something',
    //   ),
    //   Visitor(
    //     fullname: 'Jamiu Jimoh',
    //     phone: '0627987493',
    //     checkedInAt: DateTime.now(),
    //     visitReason: 'Something something',
    //   ),
    //   Visitor(
    //     fullname: 'Jamiu Jimoh',
    //     phone: '0627987493',
    //     checkedInAt: DateTime.now(),
    //     checkedOutAt: DateTime.now(),
    //     visitReason: 'Something something',
    //   ),
    // ];
    // saveAll(list);
  }

  Future<void> saveAll(List<Visitor> visitors) async {
    await isar.writeTxn(() async {
      await isar.visitorCacheModels.putAll(
        List.generate(
          visitors.length,
          (i) {
            return VisitorCacheModel.fromVisitor(visitors[i]);
          },
        ),
      );
    });
  }

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
      throw CustomException(
          'Could not find the visitor with the given phone number');
    }

    return found.toVisitor();
  }

  Future<(List<Visitor>, bool)> getActiveVisitors() async {
    final count = await isar.visitorCacheModels.count();
    final found = await isar.visitorCacheModels
        .where()
        .filter()
        .checkedOutAtIsNull()
        .sortByCheckedOutAtDesc()
        .findAll();

    final visitors = List.generate(found.length, (i) {
      return found[i].toVisitor();
    });
    return (visitors, count == 0);
  }

  Future<List<Visitor>> getVisitors(SortVisitorBy sort) async {
    final qBuilder = isar.visitorCacheModels.where();
    final list = await switch (sort) {
      SortVisitorBy.checkedIn => qBuilder.sortByCheckedInAtDesc().findAll(),
      SortVisitorBy.checkedOut => qBuilder
          .filter()
          .checkedOutAtIsNotNull()
          .sortByCheckedOutAtDesc()
          .findAll(),
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

  Future<void> getFilePath(String fileName) async {
    String? path = await FilePicker.platform.saveFile(
      dialogTitle: 'Please select an output file:',
      fileName:fileName,
      allowedExtensions: ['json', 'csv'],
    );

    if (path == null) {
      // User canceled the picker
      print('=======================');
      print('failed');
      print('=======================');
      return;
    }
    print('=======================');
    print(path);
    print('=======================');
  }

  Future<void> saveCsvFile(List<Visitor> visitors) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/visitors-logs.csv';
    final file = File(path);

    final saved = await file.writeAsString(toCSV(visitors));
    print('=======================');
    print(saved);
    print('=======================');
  }

  Future<void> saveJsonFile(List<Visitor> visitors) async {
    // final directory = await getApplicationDocumentsDirectory();
    // final path = '${directory.path}/visitors-logs.json';
    // final file = File(path);
    //
    // final list = [];
    // for (final visitor in visitors) {
    //   list.add(visitor.toMap());
    // }
    // final saved = await file.writeAsString(json.encode(list));
    // print('=======================');
    // print(saved);
    // print('=======================');
  }

  // Future<void> requestStoragePermission() async {
  //   if (await Permission.storage.request().isGranted) {
  //     // Permission granted
  //   } else {
  //     // Handle the case where the user denies the permission
  //   }
  // }
}

enum SortVisitorBy { checkedIn, checkedOut }

enum FileSaveType { csv, json }
