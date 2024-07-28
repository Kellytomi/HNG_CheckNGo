import 'package:checkngo/src/services/admin_service.dart';
import 'package:checkngo/src/services/nfc_service.dart';
import 'package:checkngo/src/services/visitors_service.dart';
import 'package:checkngo/src/views/create_visitor_page.dart';
import 'package:checkngo/src/views/home_page.dart';
import 'package:checkngo/src/views/login_page.dart';
import 'package:checkngo/src/views/visitors_logs_page.dart';
import 'package:checkngo/src/views/nfc_read_page.dart';
import 'package:checkngo/src/views/nfc_write_page.dart';
import 'package:checkngo/src/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          '/home': (_) => const HomePage(),
          '/nfc-write': (_) => const NFCWritePage(),
          '/nfc-read': (_) => const NFCReadPage(),
          '/create-visitor': (_) => const CreateVisitorPage(),
          '/manage-visitor': (_) => const VisitorsLogsPage(),
        },
      ),
    );
  }
}

