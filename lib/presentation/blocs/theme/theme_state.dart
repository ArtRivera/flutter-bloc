part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  final bool isDark;

  const ThemeState({this.isDark = false});
}

class ThemeLight extends ThemeState {
  const ThemeLight() : super(isDark: false);

  @override
  List<Object> get props => [isDark];
}

class ThemeDark extends ThemeState {
  const ThemeDark() : super(isDark: true);

  @override
  List<Object> get props => [isDark];
}
