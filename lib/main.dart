import 'package:checkngo/src/models/visitor.dart';
import 'package:checkngo/src/services/admin_service.dart';
import 'package:checkngo/src/services/nfc_service.dart';
import 'package:checkngo/src/services/visitors_service.dart';
import 'package:checkngo/src/views/create_visitor_page.dart';
import 'package:checkngo/src/views/dashboard_page.dart';
import 'package:checkngo/src/views/login_page.dart';
import 'package:checkngo/src/views/manage_visitors_page.dart';
import 'package:checkngo/src/views/nfc_read_page.dart';
import 'package:checkngo/src/views/nfc_write_page.dart';
import 'package:checkngo/src/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<VisitorsService>(
          create: (_) => VisitorsService(),
        ),
        Provider<AdminService>(
          create: (_) => AdminService(),
        ),
        Provider<NFCService>(
          create: (_) => NFCService(),
        ),
      ],
      child: MaterialApp(
        home: const LoginPage(),
        routes: {
          '/login': (_) => const LoginPage(),
          '/register': (_) => const RegisterPage(),
          '/dashboard': (_) => const DashboardPage(),
          '/nfc-write': (_) => const NFCWritePage(),
          '/nfc-read': (ctx) {
            final visitor = ModalRoute.of(ctx)!.settings.arguments as Visitor;
            return NFCReadPage(visitor: visitor);
          },
          '/create-visitor': (_) => const CreateVisitorPage(),
          '/manage-visitor': (_) => const ManageVisitorsPage(),
        },
      ),
    );
  }
}

