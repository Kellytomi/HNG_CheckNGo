import 'package:checkngo/src/models/visitor.dart';
import 'package:checkngo/src/services/db_service.dart';
import 'package:checkngo/src/services/visitors_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class VisitorsLogsPage extends StatelessWidget {
  const VisitorsLogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<VisitorsService>();

    // You can use this when you use a FutureBuilder to getVisitors
    // future: controller.getVisitors(SortVisitorBy.checkedIn),
    return Scaffold();
  }
}
