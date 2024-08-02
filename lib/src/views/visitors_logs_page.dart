import 'dart:io';

import 'package:checkngo/src/models/visitor.dart';
import 'package:checkngo/src/services/visitors_service.dart';
import 'package:checkngo/src/utils/colors.dart';
import 'package:checkngo/src/utils/constants.dart';
import 'package:checkngo/src/views/app_dialogs.dart';
import 'package:checkngo/src/views/empty_state_content.dart';
import 'package:checkngo/src/views/visitor_log_sort_switcher.dart';
import 'package:checkngo/src/views/visitor_log_tile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:checkngo/src/services/db_service.dart';

class VisitorsLogsPage extends StatefulWidget {
  const VisitorsLogsPage({super.key});

  @override
  State<VisitorsLogsPage> createState() => _VisitorsLogsPageState();
}

class _VisitorsLogsPageState extends State<VisitorsLogsPage> {
  var sort = SortVisitorBy.checkedIn;
  final _visitors = <Visitor>[];
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final controller = context.read<VisitorsService>();
      final list = await controller.getVisitors(SortVisitorBy.checkedIn);
      _visitors.addAll(list);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<VisitorsService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitors Logs'),
        centerTitle: false,
        actions: [
          if (_visitors.isNotEmpty)
            if (!_isLoading)
              PopupMenuButton(
                elevation: 1.0,
                shadowColor: const Color(0x6ED3D3D3),
                icon: const Icon(Icons.more_vert, color: kFontColor3),
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem(
                    enabled: false,
                    child: Text(
                      'Download data',
                      style: GoogleFonts.montserrat(
                        fontSize: 12.0,
                        color: const Color(0xFFA7A7A7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () => _save(FileSaveType.csv),
                    child: Row(
                      children: [
                        Text(
                          'CSV Download',
                          style: GoogleFonts.montserrat(
                            fontSize: 14.0,
                            color: const Color(0xFF6B6B6B),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        SvgPicture.asset('assets/download.svg'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () => _save(FileSaveType.json),
                    child: Row(
                      children: [
                        Text(
                          'JSON Download',
                          style: GoogleFonts.montserrat(
                            fontSize: 14.0,
                            color: const Color(0xFF6B6B6B),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        SvgPicture.asset('assets/download.svg'),
                      ],
                    ),
                  ),
                ],
              ),
        ],
      ),
      body: Padding(
        padding: commonPadding,
        child: Column(
          children: [
            VisitorLogSortSwitcher(
              sort: sort,
              onSwitch: (s) => setState(() => sort = s),
            ),
            const SizedBox(height: 10.0),
            FutureBuilder<List<Visitor>>(
              future: controller.getVisitors(sort),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const EmptyStateContent(
                    text: 'An error occured while fetching log!',
                  );
                } else if (snapshot.hasData) {
                  final visitors = snapshot.data!;
                  if (sort == SortVisitorBy.checkedOut &&
                      visitors.every((v) => v.checkedOutAt == null)) {
                    return const Expanded(
                      child: EmptyStateContent(
                        text:
                            'There are currently no check out entries in your log history.',
                      ),
                    );
                  }
                  if (visitors.isEmpty) {
                    return const Expanded(
                      child: EmptyStateContent(
                        text:
                            'There are currently no entries in your log history. Start checking visitors in by writing to NFC tags.',
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: visitors.length,
                      itemBuilder: (context, index) {
                        final visitor = visitors[index];
                        return VisitorLogTile(
                          sort: sort,
                          visitor: visitor,
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              '/visitor-details',
                              arguments: visitor,
                            );
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _save(FileSaveType type) async {
    try {
      final service = context.read<DBService>();
      String? path;
      if (type == FileSaveType.csv) {
        path = await service.saveCsvFile(_visitors);
      } else {
        path = await service.saveJsonFile(_visitors);
      }
      if (path == null) return;
      if (!mounted) return;
      await AppDialogs.showSuccessDialog(
        context: context,
        showCTA: false,
        title: 'Saved',
        description: 'Visitors logs saved successfully at:\n\n"$path"',
      );
    } on PathAccessException catch (e) {
      final message =
          '${e.osError?.message ?? ''}. Cannot use path:\n\n"${e.path}".';
      if (!mounted) return;
      await AppDialogs.showErrorDialog(
        context: context,
        message: message,
        showCTA: false,
      );
    } catch (_) {}
  }
}
