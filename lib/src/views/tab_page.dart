import 'package:checkngo/src/utils/colors.dart';
import 'package:checkngo/src/views/home_page.dart';
import 'package:checkngo/src/views/visitors_logs_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

const _pages = [HomePage(), VisitorsLogsPage()];

class _TabPageState extends State<TabPage> {
  var _currentIndex = 0;

  void _onDestinationSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  ColorFilter _getColorFilter(bool isCurrentPage) {
    return ColorFilter.mode(
      isCurrentPage ? kPrimaryColor : kOnSurfaceColor,
      BlendMode.srcIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onDestinationSelected,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/nfc_tag_icon.svg',
              colorFilter: _getColorFilter(_currentIndex == 0),
            ),
            label: 'NFC Tag',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/visitors_logs_icon.svg',
              colorFilter: _getColorFilter(_currentIndex == 1),
            ),
            label: 'Visitors Logs',
          ),
        ],
      ),
    );
  }
}
