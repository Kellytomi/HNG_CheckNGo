import 'package:checkngo/src/models/visitor.dart';
import 'package:checkngo/src/services/db_service.dart';
import 'package:checkngo/src/services/visitors_service.dart';
import 'package:checkngo/src/utils/colors.dart';
import 'package:checkngo/src/utils/constants.dart';
import 'package:checkngo/src/utils/custom_exception.dart';
import 'package:checkngo/src/views/empty_state_content.dart';
import 'package:checkngo/src/views/visitor_log_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'app_dialogs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isEmpty = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final controller = context.read<VisitorsService>();
      final res = await controller.isEmptyList();
      setState(() {
        isEmpty = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<VisitorsService>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: commonPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffE6E6E6), Color(0xffD8EBFF)],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 19),
                  child: Text(
                    'Welcome',
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff003366)),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Expanded(
                child: FutureBuilder<(List<Visitor>, bool)>(
                  future: controller.getActiveVisitors(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (snapshot.hasError) {
                      return const EmptyStateContent(
                        text:
                            'An error occured while fetching active visitors!',
                      );
                    } else if (snapshot.hasData) {
                      final visitors = snapshot.data!;

                      if (visitors.$1.isEmpty) {
                        return Column(
                          children: [
                            Expanded(
                              child: EmptyStateContent(
                                text: visitors.$2
                                    ? 'It seems like you just got here. Start checking visitors in by writing to NFC tags.'
                                    : 'There are currently no active visitors.',
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/check-in');
                              },
                              child: const Text("Write to NFC tag"),
                            ),
                            const SizedBox(height: 20.0),
                          ],
                        );
                      }
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Active visitors',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff707070),
                                  ),
                                ),
                              ),
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  minimumSize: const Size(20.0, 38.0),
                                  side: const BorderSide(
                                      color: Color(0xff003366)),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/check-in');
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Add visitor',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff003366),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Icon(
                                      Icons.add,
                                      size: 15.0,
                                      color: Color(0xff003366),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Expanded(
                            child: ListView.builder(
                              // shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemCount: visitors.$1.length,
                              itemBuilder: (context, index) {
                                final visitor = visitors.$1[index];
                                return VisitorLogTile(
                                  sort: SortVisitorBy.checkedIn,
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
                          ),
                          // const SizedBox(height: 50.0),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: isEmpty
          ? null
          : FloatingActionButton.extended(
              backgroundColor: kPrimaryColor,
              extendedPadding:
                  const EdgeInsets.symmetric(vertical: 19.5, horizontal: 15.0),
              onPressed: () => _read(context),
              label: Row(
                children: [
                  Text(
                    'Read Tag to checkout',
                    style: GoogleFonts.inter(
                        color: kBGColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    'assets/nfc_tag_icon.svg',
                    height: 16.0,
                    width: 16.0,
                    colorFilter: const ColorFilter.mode(
                      kBGColor,
                      BlendMode.srcIn,
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Future<void> _read(BuildContext context) async {
    final nav = Navigator.of(context);

    try {
      final service = context.read<VisitorsService>();
      AppDialogs.showNFCScan(context: context, title: 'Ready to Read');
      final savedVisitor = await service.readNFC();
      if (!context.mounted) return;
      _popDialog(context);
      await Navigator.of(context).pushReplacementNamed(
        '/tag-info',
        arguments: {
          'visitor': savedVisitor,
          'buttonText': 'Check Out',
          'onCancel': () {
            nav.pushReplacementNamed('/tab');
          },
          'onPressed': (ctx) async {
            try {
              final visitor = await service.checkOut(savedVisitor.phone);
              if (!ctx.mounted) return;
              await AppDialogs.showSuccessDialog(
                context: ctx,
                title: 'Checkout complete',
                buttonText: 'Back to home',
                description: '${visitor.fullname} has been checked out.',
                onPressed: () {
                  _popDialog(ctx);
                  Navigator.of(ctx).pushReplacementNamed('/tab');
                },
              );
            } on CustomException catch (e) {
              if (!ctx.mounted) return;
              _popDialog(ctx);
              await AppDialogs.showErrorDialog(
                context: ctx,
                message: e.message,
                onPressed: () {
                  _popDialog(ctx);
                  Navigator.of(ctx).pushReplacementNamed('/tab');
                },
                onCancel: () {
                  _popDialog(ctx);
                  Navigator.of(ctx).pushReplacementNamed('/tab');
                },
              );
            } catch (_) {}
          },
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
        _read(context);
      },
      onCancel: Navigator.of(context).pop,
    );
  }
}
