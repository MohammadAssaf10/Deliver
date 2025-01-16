import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/route_observer_helper.dart';
import '../bloc/main_bloc.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/main_bottom_navigation_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    RouteObserverHelper.mainRouteObserver
        .subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    RouteObserverHelper.mainRouteObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    if (context.read<MainBloc>().state.trip == null) {
      context.read<MainBloc>().getCurrentTrip();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: PageView(
        onPageChanged: (index) {
          context.read<MainBloc>().setPageIndex(index);
          if (index == 0) {
            context.read<MainBloc>().getCurrentTrip();
          }
        },
        controller: context.read<MainBloc>().pageController,
        children: context.read<MainBloc>().pages,
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
