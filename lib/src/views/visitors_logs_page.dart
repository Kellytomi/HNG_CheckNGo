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
        child: StreamBuilder(
          stream: controller.getVisitors(),
          builder: (_, snapshot) {
            return switch (snapshot.connectionState) {
              ConnectionState.waiting => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ConnectionState.done when snapshot.hasError => const Center(
                  child: Text('An error occurred'),
                ),
              ConnectionState.done when snapshot.hasData =>
                snapshot.data!.isEmpty
                    ? const Center(child: Text('No visitors yet'))
                    : ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, i) {
                          final visitor = snapshot.data![i];
                          return ListTile(
                            title: Text(visitor.fullname),
                            subtitle: Text(visitor.phone),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('Checked ${visitor.status.name}'),
                                Text(
                                  DateFormat('MMMM dd, yyyy, mm:ss')
                                      .format(DateTime.now())
                                      .toString(),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              _ => const SizedBox(),
            };
          },
        ),
      ),
    );
  }
}
