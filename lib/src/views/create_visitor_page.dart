import 'package:checkngo/src/services/visitors_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateVisitorPage extends StatefulWidget {
  const CreateVisitorPage({super.key});

  @override
  State<CreateVisitorPage> createState() => _CreateVisitorPageState();
}

class _CreateVisitorPageState extends State<CreateVisitorPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Visitor')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(labelText: 'Fullname'),
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
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  final validated = _formKey.currentState?.validate() ?? false;
                  if (!validated) return;

                  try {
                    final controller = context.read<VisitorsService>();
                    await controller.createVisitor(
                      name: _nameController.text,
                      phone: _phoneController.text,
                      email: _emailController.text,
                    );
                    if (!context.mounted) return;
                    Navigator.pushNamed(context, '/nfc-write');
                  } catch (_) {
                    // TODO: error handling
                  }
                },
                child: const Text('Create Visitor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
