import 'package:checkngo/src/services/admin_service.dart';
import 'package:checkngo/src/services/nfc_service.dart';
import 'package:checkngo/src/services/visitors_service.dart';
import 'package:checkngo/src/views/check_in_page.dart';
import 'package:checkngo/src/views/home_page.dart';
import 'package:checkngo/src/views/login_page.dart';
import 'package:checkngo/src/views/visitors_logs_page.dart';
import 'package:checkngo/src/views/check_out_page.dart';
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
        Provider<NFCService>(create: (_) => NFCService()),

        Provider<AdminService>(create: (_) => AdminService()),

        ProxyProvider2<AdminService, NFCService, VisitorsService>(
          update: (_, adminService, nfcService, __) {
            return VisitorsService(
              adminService: adminService,
              nfcService: nfcService,
            );
          },
        ),
      ],
      child: MaterialApp(
        home: const LoginPage(),
        routes: {
          '/login': (_) => const LoginPage(),
          '/register': (_) => const RegisterPage(),
          '/home': (_) => const HomePage(),
          '/nfc-read': (_) => const CheckOutPage(),
          '/create-visitor': (_) => const CheckInPage(),
          '/manage-visitor': (_) => const VisitorsLogsPage(),
        },
      ),
    );
  }
}
