import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:acc_hack/presentation/feature/filters/filters.dart';
import 'package:acc_hack/presentation/feature/theme_switcher/cubit/theme_switcher_cubit.dart';

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeSwitcherCubit()),
        BlocProvider(create: (context) => FiltersCubit()),
      ],
      child: child,
    );
  }
}
