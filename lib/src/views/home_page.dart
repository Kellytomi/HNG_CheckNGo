import 'package:checkngo/src/views/create_visitor_page.dart';
import 'package:checkngo/src/views/visitors_logs_page.dart';
import 'package:checkngo/src/views/nfc_read_page.dart';
import 'package:checkngo/src/views/widgets/custom_navbar.dart';
import 'package:checkngo/src/views/widgets/nav_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const _pages = [NFCReadPage(), CreateVisitorPage(), VisitorsLogsPage()];

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;

  void _goToBranch(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SafeArea(
        child: CustomNavBar(
          onTabSelected: _goToBranch,
          navItem: [
            NavItem(
              isActive: _currentIndex == 0,
              icon: Icons.scanner,
            ),
            NavItem(
              isActive: _currentIndex == 1,
              icon: Icons.print,
            ),
            NavItem(
              isActive: _currentIndex == 2,
              icon: Icons.list,
            ),
          ],
        ),
      ),
    );
  }
}
