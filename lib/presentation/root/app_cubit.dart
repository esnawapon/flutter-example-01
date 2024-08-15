import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(): super(const AppState());

  void updateThemeMode(ThemeMode value) {
    emit(state.copyWith(themeMode: value));
  }
}

class AppState extends Equatable {
  const AppState({
    this.themeMode = ThemeMode.system,
  });
  
  final ThemeMode themeMode;

  AppState copyWith({
    ThemeMode? themeMode,
  }) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  @override
  List<Object?> get props => [
    themeMode,
  ];

}
