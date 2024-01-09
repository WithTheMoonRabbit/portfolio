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
    HomeWidget(),
    WorkPage(),
    ContactPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
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

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10,top: 35, bottom: 10,right: 10),
        child: Card(
          color: Colors.blue.shade50,
          elevation: 10,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Card(
                  color: Colors.white,
                  elevation: 30,
                  child: Image.asset(
                    'assets/images/logo_img/main_logo.gif',
                    width: 250,
                    height: 250,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(22.0),
                child: Text(
                  '개발자로서 창의적이고 협력적인 팀워크로 안정적인 서비스를 운영하며,\n사용자의 만족과 피드백을 바탕으로\n지속적으로 성장하고자 합니다.',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
