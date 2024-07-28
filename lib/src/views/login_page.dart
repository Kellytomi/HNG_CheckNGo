import 'package:checkngo/src/services/admin_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter a valid password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/register');
                },
                child: const Text('Don\'t have an account yet? Register'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  final validated = _formKey.currentState?.validate() ?? false;
                  if (!validated) return;

                  try {
                    final controller = context.read<AdminService>();
                    await controller
                        .login(
                      email: _emailController.text,
                      password: _passwordController.text,
                    )
                        .then((value) {
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Error: $error"),
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(seconds: 6),
                        ),
                      );
                    });
                    if (!context.mounted) return;
                    Navigator.pushReplacementNamed(context, '/dashboard');
                  } catch (_) {
                    // TODO: error handling
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
