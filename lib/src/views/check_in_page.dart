import 'package:checkngo/src/models/visitor.dart';
import 'package:checkngo/src/services/visitors_service.dart';
import 'package:checkngo/src/views/app_dialogs.dart';
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
  late TextEditingController _visitReasonController;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _visitReasonController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _visitReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Check In')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // TextFormField(
              //   controller: _nameController,
              //   keyboardType: TextInputType.name,
              //   decoration: const InputDecoration(labelText: 'Full Name'),
              //   validator: (val) {
              //     if (val == null || val.isEmpty) {
              //       return 'Please enter a valid name';
              //     }
              //     return null;
              //   },
              // ),
              // ElevatedButton(
              //   onPressed: () async {
              //     final validated = _formKey.currentState?.validate() ?? false;
              //     if (!validated) return;
              //     final service = context.read<VisitorsService>();
              //     service.checkIn(
              //       name: _nameController.text,
              //       phone: _phoneController.text,
              //       email: _emailController.text,
              //       visitReason: _visitReasonController.text,
              //     );
              //   },
              //   child: const Text('Scan NFC to check in'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
