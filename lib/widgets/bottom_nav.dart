import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,

      selectedItemColor:
          const Color(0xFF6FBF73),

      unselectedItemColor:
          Colors.grey,

      onTap: onTap,

      items: const [

        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Jadwal',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
    );
  }
}