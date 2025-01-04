import 'package:flutter/material.dart';

import '../../../../core/theming/styles_manager.dart';
import '../../../../generated/l10n.dart';
import '../widgets/main_bottom_navigation_bar.dart';
import 'home_body.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController pageController = PageController();
  final List<Widget> pages = const [
    HomeBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Container(
            margin: const EdgeInsetsDirectional.only(start: 15, bottom: 15),
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              S.of(context).deliver,
              style: TextStyles.font33DarkWhiteBold,
            ),
          ),
        ),
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
      body: PageView(
        controller: pageController,
        children: pages,
      ),
    );
  }
}
