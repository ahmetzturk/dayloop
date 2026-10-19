import 'package:flutter/material.dart';

import 'package:dayloop/screens/notes/notes_screen.dart';
import 'package:dayloop/screens/routines/routines_screen.dart';
import 'package:dayloop/screens/settings/settings_screen.dart';
import 'package:dayloop/screens/tasks/tasks_screen.dart';
import 'package:dayloop/screens/today/today_screen.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _selectedIndex = 0;

  // Sıra, alt menüdeki sekmelerin sırasıyla aynı olmalı
  static const List<Widget> _screens = [
    TodayScreen(),
    TasksScreen(),
    NotesScreen(),
    RoutinesScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack sekme değişince ekranların durumunu korur
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.today_outlined),
            selectedIcon: Icon(Icons.today),
            label: 'Bugün',
          ),
          NavigationDestination(
            icon: Icon(Icons.checklist),
            label: 'Görevler',
          ),
          NavigationDestination(
            icon: Icon(Icons.sticky_note_2_outlined),
            selectedIcon: Icon(Icons.sticky_note_2),
            label: 'Notlar',
          ),
          NavigationDestination(
            icon: Icon(Icons.repeat),
            label: 'Rutinler',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Ayarlar',
          ),
        ],
      ),
    );
  }
}
