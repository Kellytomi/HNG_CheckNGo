import 'package:checkngo/src/services/visitors_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageVisitorsPage extends StatelessWidget {
  const ManageVisitorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<VisitorsService>();

    return Scaffold(
      appBar: AppBar(title: const Text('Manage Visitors')),
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
              ConnectionState.done when snapshot.hasData => ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, i) {
                    final visitor = snapshot.data![i];
                    return ListTile(
                      title: Text(visitor.fullname),
                      subtitle: Text(visitor.email),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          '/nfc-read',
                          arguments: visitor,
                        );
                      },
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
