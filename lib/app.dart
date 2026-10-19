import 'package:flutter/material.dart';

import 'package:dayloop/screens/home_shell.dart';
import 'package:dayloop/theme/app_theme.dart';

class DayloopApp extends StatelessWidget {
  const DayloopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dayloop',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomeShell(),
    );
  }
}
