import 'package:flutter/material.dart';

import '../../../maps/presentation/pages/map_page.dart';
import '../widgets/bottom_navigation__bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController pageController = PageController();
  final List<Widget> pages = const [
    MapPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MainBottomNavigationBar(),
      body: PageView(
        controller: pageController,
        children: pages,
      ),
    );
  }
}
