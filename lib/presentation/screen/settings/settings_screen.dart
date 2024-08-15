import 'package:flutter/material.dart';
import 'package:flutter_example_01/presentation/screen/settings/settings_theme_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: const [
          SettingsThemeTile(),
        ],
      ),
    );
  }
}
