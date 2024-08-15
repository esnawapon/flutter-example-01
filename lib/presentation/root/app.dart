import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example_01/presentation/root/app_cubit.dart';
import 'package:flutter_example_01/presentation/root/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocSelector<AppCubit, AppState, ThemeMode>(
        selector: (state) => state.themeMode,
        builder: (context, themeMode) {
          return MaterialApp(
            themeMode: themeMode,
            darkTheme: ThemeData.dark(),
            theme: ThemeData.light(),
            initialRoute: AppRoutes.home,
            onGenerateRoute: AppRoutesMapper.onGenerateRoute,
          );
        },
      ),
    );
  }
}
