import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example_01/presentation/root/app_cubit.dart';

class SettingsThemeTile extends StatelessWidget {
  const SettingsThemeTile({super.key});

  Future<ThemeMode?> _openThemeBottomSheet(BuildContext context, ThemeMode appThemeMode) {
    return showModalBottomSheet<ThemeMode>(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: ThemeMode.values.length,
          itemBuilder: (context, i) {
            final themeMode = ThemeMode.values[i];
            final isAppThemeMode = appThemeMode == themeMode;
            return ListTile(
              title: Text(themeMode.name),
              leading: isAppThemeMode //
                  ? const Icon(Icons.check)
                  : const Icon(Icons.circle_outlined),
              onTap: isAppThemeMode //
                  ? null
                  : () => Navigator.pop(context, themeMode),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppCubit, AppState, ThemeMode>(
      selector: (state) => state.themeMode,
      builder: (context, appThemeMode) {
        return ListTile(
          title: const Text("Theme"),
          subtitle: Text(appThemeMode.name),
          onTap: () async {
            final value = await _openThemeBottomSheet(context, appThemeMode);
            if (context.mounted && value != null) {
              context.read<AppCubit>().updateThemeMode(value);
            }
          },
        );
      },
    );
  }
}
