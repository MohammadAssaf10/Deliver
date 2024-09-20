import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../maps/presentation/bloc/map_bloc.dart';
import '../../../maps/presentation/bloc/map_state.dart';
import '../../../maps/presentation/pages/map_page.dart';
import '../../../maps/presentation/widgets/map_app_bar.dart';
import '../../../maps/presentation/widgets/map_floating_action_button.dart';
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
      appBar: const MapAppBar(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlocBuilder<MapBloc, MapState>(
            builder: (context, state) {
              return MapFloatingActionButton(
                onPress: state.isLoading
                    ? null
                    : () {
                        context.read<MapBloc>().addGetCurrentLocation();
                      },
                icon: Icons.location_on_outlined,
                isLoading: state.isLoading,
              );
            },
          ),
          const SizedBox(height: 10),
          MapFloatingActionButton(
            onPress: () {},
            icon: Icons.add,
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        children: pages,
      ),
    );
  }
}
