import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:blocs_app/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  serviceLocatorInit();
  runApp(const BlocsProviders());
}


class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<UsernameCubit>(create: (_) => getIt<UsernameCubit>()),
      BlocProvider<RouterSimpleCubit>(create: (_) => getIt<RouterSimpleCubit>()),
      BlocProvider<CounterCubit>(create: (_) => getIt<CounterCubit>()),
      BlocProvider<ThemeCubit>(create: (_) => getIt<ThemeCubit>()),
      BlocProvider<GuestsBloc>(create: (_) => getIt<GuestsBloc>()),
      BlocProvider<PokemonBloc>(create: (_) => getIt<PokemonBloc>()),
      BlocProvider<GeolocationCubit>(create: (_) => getIt<GeolocationCubit>()),
      BlocProvider<HistoricLocationBloc>(create: (_) => getIt<HistoricLocationBloc>()),
    ], child: const MyApp(),);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final appRouter = context.watch<RouterSimpleCubit>().state;
    final themeCubit = context.watch<ThemeCubit>().state;

    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme( isDarkmode: themeCubit.isDark ).getTheme(),
    );
  }
}
