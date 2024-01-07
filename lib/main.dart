import 'package:flutter/material.dart';
import 'package:portfolio/pages/work_page.dart';
import 'package:portfolio/themes/light_mode.dart';

import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/contact_page.dart';
import 'package:portfolio/pages/settings_page.dart';
import 'package:portfolio/pages/work_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const HomePage(),
      routes: {
        '/home_page' : (context) => const HomePage(),
        '/contact_page' : (context) => const ContactPage(),
        '/work_page' : (context) => const WorkPage(),
        '/settings_page' : (context) => const SettingsPage(),

        '/work_stack_list' : (context) => const WorkPage(),

      },
    );
  }
}