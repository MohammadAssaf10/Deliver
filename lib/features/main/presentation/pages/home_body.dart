import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/loader.dart';
import '../bloc/main_bloc.dart';
import '../bloc/main_state.dart';
import '../widgets/user_do_not_have_trip_widget.dart';
import '../widgets/user_have_trip_widget.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: state.isLoading
              ? Loader()
              : state.trip == null
                  ? UserDoNotHaveTripWidget()
                  : UserHaveTripWidget(),
        );
      },
    );
  }
}
