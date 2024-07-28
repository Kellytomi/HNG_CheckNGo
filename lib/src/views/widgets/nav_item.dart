import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.isActive,
    required this.icon,
  });
  final bool isActive;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 36.0,
        width: 36.0,
        decoration: BoxDecoration(
          color: isActive ? Colors.red : Colors.black,
          borderRadius: BorderRadius.circular(34.0),
        ),
        child: Icon(icon, color: Colors.blue, size: 24.0));
  }
}
