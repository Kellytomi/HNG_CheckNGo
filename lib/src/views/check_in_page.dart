import 'dart:async';

import 'package:checkngo/src/models/visitor.dart';
import 'package:checkngo/src/services/visitors_service.dart';
import 'package:checkngo/src/utils/constants.dart';
import 'package:checkngo/src/utils/custom_exception.dart';
import 'package:checkngo/src/utils/string_extensions.dart';
import 'package:checkngo/src/views/app_dialogs.dart';
import 'package:checkngo/src/views/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      appBar: AppBar(title: const Text('Add tag information')),
      body: Padding(
        padding: commonPadding,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextfield(
                  label: 'Full name',
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter a valid name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 28.0),
                CustomTextfield(
                  label: 'Phone number',
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter a valid phone number';
                    }
                    if (val.length < 11 || val.length > 14) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 28.0),
                CustomTextfield(
                  isOptional: true,
                  label: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 28.0),
                CustomTextfield(
                  isOptional: true,
                  label: 'Reason for visitation',
                  controller: _visitReasonController,
                  hintText: 'Not more than 60 characters.',
                  maxLines: 2,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(60),
                  ],
                ),
                const SizedBox(height: 60.0),
                ElevatedButton(
                  onPressed: () => _write(context),
                  child: const Text('Write'),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FutureOr<void> _write(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final validated = _formKey.currentState?.validate() ?? false;
    if (!validated) return;

    final nav = Navigator.of(context);
    try {
      final service = context.read<VisitorsService>();
      AppDialogs.showNFCScan(context: context, title: 'Ready to Write');
      final visitor = await service.checkIn(
        name: _nameController.text.toTitleCase(),
        phone: _phoneController.text,
        email: _emailController.text,
        visitReason: _visitReasonController.text,
      );

      if (!context.mounted) return;
      _popDialog(context);
      await AppDialogs.showSuccessDialog(
        context: context,
        title: 'Checkin complete',
        buttonText: 'View Tag Info',
        description:
            '${_nameController.text.toTitleCase()} has been checked in.',
        onPressed: Navigator.of(context).pop,
      );
      if (!context.mounted) return;
      Navigator.of(context).pushReplacementNamed(
        '/tag-info',
        arguments: {
          'visitor': visitor,
          'onPressed': (ctx) {
            nav.pushReplacementNamed('/tab');
          }
        },
      );
    } on CustomException catch (e) {
      if (!context.mounted) return;
      _popDialog(context);
      await _displayErrorDialog(context: context, message: e.message);
    } catch (e) {
      if (!context.mounted) return;
      _popDialog(context);
      await _displayErrorDialog(context: context);
    }
  }

  void _popDialog(BuildContext context) {
    final dialogActive = ModalRoute.of(context)?.isCurrent != true;
    if (dialogActive) {
      Navigator.of(context).pop();
    }
  }

  Future<void> _displayErrorDialog({
    required BuildContext context,
    String? message,
  }) async {
    if (!context.mounted) return;
    _popDialog(context);
    await AppDialogs.showErrorDialog(
      context: context,
      message: message ?? 'Device could not read NFC Tag',
      onPressed: () {
        _popDialog(context);
        _write(context);
      },
      onCancel: Navigator.of(context).pop,
    );
  }
}
