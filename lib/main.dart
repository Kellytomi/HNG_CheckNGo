import 'package:checkngo/src/models/visitor.dart';
import 'package:checkngo/src/models/visitor_cache_model.dart';
import 'package:checkngo/src/services/db_service.dart';
import 'package:checkngo/src/services/nfc_service.dart';
import 'package:checkngo/src/services/visitors_service.dart';
import 'package:checkngo/src/utils/app_theme.dart';
import 'package:checkngo/src/views/check_in_page.dart';
import 'package:checkngo/src/views/tab_page.dart';
import 'package:checkngo/src/views/tag_info_page.dart';
import 'package:checkngo/src/views/visitor_details_page.dart';
import 'package:checkngo/src/views/visitors_logs_page.dart';
import 'package:checkngo/src/views/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [VisitorCacheModelSchema],
    directory: dir.path,
  );

  runApp(MainApp(isar: isar));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.isar});
  final Isar isar;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NFCService>(create: (_) => NFCService()),
        Provider<DBService>(create: (_) => DBService(isar)),
        ProxyProvider2<DBService, NFCService, VisitorsService>(
          update: (_, dbService, nfcService, __) {
            return VisitorsService(
              nfcService: nfcService,
              dbService: dbService,
            );
          },
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        home: const WelcomePage(),
        // home: const TabPage(),
        routes: {
          '/tab': (_) => const TabPage(),
          '/create-visitor': (_) => const CheckInPage(),
          '/tag-info': (ctx) {
            final params =
                ModalRoute.of(ctx)!.settings.arguments as Map<String, Object>;
            return TagInfoPage(
              visitor: params['visitor'] as Visitor,
              buttonText: params['buttonText'] as String?,
              onCancel: params['onCancel'] as VoidCallback?,
              onPressed: params['onPressed'] as Function(BuildContext)?,
            );
          },
          '/visitor-details': (ctx) {
            final visitor = ModalRoute.of(ctx)!.settings.arguments as Visitor;
            return VisitorDetailsPage(visitor: visitor);
          },
          '/check-in': (_) => const CheckInPage(),
          '/manage-visitor': (_) => const VisitorsLogsPage(),
        },
      ),
    );
  }
}
