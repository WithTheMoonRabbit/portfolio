import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:portfolio/pages/work_page.dart';
import 'package:portfolio/pages/contact_page.dart';
import 'package:portfolio/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Hello, Home Page!'),
    //WorkPage(),
    WorkPage(),
    ContactPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GNav(

          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
          tabActiveBorder: Border.all(color: Colors.black, width: 1.2),
          haptic: true,
          gap: 3,

          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              icon: Icons.work_outline,
              text: 'Work',
            ),
            GButton(
              icon: Icons.contact_page_outlined,
              text: 'Contact',
            ),
            GButton(
              icon: Icons.settings_outlined,
              text: 'Settings',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
