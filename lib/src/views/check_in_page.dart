import 'package:checkngo/src/services/visitors_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _visitReason;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _visitReason = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _visitReason.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Check In')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              // const SizedBox(height: 10.0),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration:
                    const InputDecoration(labelText: 'Email (Optional)'),
              ),
              const SizedBox(height: 20.0),

              TextFormField(
                controller: _visitReason,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: 'Reason for visit (Optional)'),
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () async {
                  final validated = _formKey.currentState?.validate() ?? false;
                  if (!validated) return;

                  try {
                    final controller = context.read<VisitorsService>();
                    await controller.checkIn(
                      name: _nameController.text,
                      phone: _phoneController.text,
                      email: _emailController.text,
                      visitReason: _visitReason.text,
                    );
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Visitor checked in successfully')),
                    );
                  } catch (_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Error occurred while checking in')),
                    );
                  }
                },
                child: const Text('Scan NFC to check in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
