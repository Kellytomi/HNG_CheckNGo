import 'package:checkngo/src/models/visitor.dart';
import 'package:checkngo/src/services/visitors_service.dart';
import 'package:checkngo/src/utils/constants.dart';
import 'package:checkngo/src/views/empty_state_content.dart';
import 'package:checkngo/src/views/visitor_log_sort_switcher.dart';
import 'package:checkngo/src/views/visitor_log_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:checkngo/src/services/db_service.dart';

class VisitorsLogsPage extends StatefulWidget {
  const VisitorsLogsPage({super.key});

  @override
  State<VisitorsLogsPage> createState() => _VisitorsLogsPageState();
}

class _VisitorsLogsPageState extends State<VisitorsLogsPage> {
  var sort = SortVisitorBy.checkedIn;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<VisitorsService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitor\'s Logs'),
        centerTitle: false,
        actions: [
          // IconButton(
          //   icon: const Icon(Icons.more_vert),
          //   onPressed: () {
          //     // Open a dialog box that shows CSV Download and JSON Download

          //   },
          // ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem(
                child: Text('Download',style: TextStyle(color: Colors.grey),),
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    const Text('CSV Download'),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.download),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                  child: Row(
                children: [
                  const Text('JSON Download'),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                  ),
                ],
              )),
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
            Expanded(
              child: FutureBuilder<List<Visitor>>(
                future: controller.getVisitors(sort),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (snapshot.hasError) {
                    return const EmptyStateContent(
                      text: 'An error occured while fetching log!',
                    );
                  } else if (snapshot.hasData) {
                    final visitors = snapshot.data!;
                    if (sort == SortVisitorBy.checkedOut &&
                        visitors.every((v) => v.checkedOutAt == null)) {
                      return const EmptyStateContent(
                        text:
                            'There are currently no check out entries in your log history.',
                      );
                    }
                    if (visitors.isEmpty) {
                      return const EmptyStateContent(
                        text:
                            'There are currently no entries in your log history. Start checking visitors in by writing to NFC tags.',
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
            ),
          ],
        ),
      ),
    );
  }
}
