import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/visitors_service.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Out'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(radius: 70.0),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final controller = context.read<VisitorsService>();
                    await controller.checkOut();
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Visitor checked out successfully')),
                    );
                  } catch (_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Error occurred while checking out')),
                    );
                  }
                },
                child: const Text('Scan NFC to check out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
