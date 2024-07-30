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

    return Scaffold(
      appBar: AppBar(title: const Text('Visitors Logs')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: FutureBuilder<List<Visitor>>(
          future: controller.getVisitors(SortVisitorBy.checkedIn),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('An error occurred'));
            } else if (snapshot.hasData) {
              final visitors = snapshot.data!;
              if (visitors.isEmpty) {
                return const Center(child: Text('No visitors yet'));
              }
              return ListView.builder(
                itemCount: visitors.length,
                itemBuilder: (_, i) {
                  final visitor = visitors[i];
                  return ListTile(
                    title: Text(visitor.fullname),
                    subtitle: Text(visitor.phone),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Checked ${visitor.status.name}'),
                        Text(
                          DateFormat('MMMM dd, yyyy, mm:ss')
                              .format(visitor.checkedInAt)
                              .toString(),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
