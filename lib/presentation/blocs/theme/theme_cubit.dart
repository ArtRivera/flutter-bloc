
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeLight());

  void setDarkMode() => emit(const ThemeDark());

  void setLightMode() => emit(const ThemeLight());

  void toggleTheme() {
    if (state is ThemeLight) {
      setDarkMode();
    } else {
      setLightMode();
    }
  }
}
