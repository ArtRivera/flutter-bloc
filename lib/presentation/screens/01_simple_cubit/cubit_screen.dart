import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // One way to watch our cubit
    // final usernameCubit = context.watch<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      // body:  Center(
      //   child: Text(usernameCubit.state),
      // ),
      body: BlocBuilder<UsernameCubit, String>(
        builder: (context, state) {
          return Center(
            child: Text(state),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final String randomName = RandomGenerator.getRandomName();
          // Another way to emit to our cubit
          context.read<UsernameCubit>().setUsername(randomName);
          // Way to emit to our cubit
          // usernameCubit.setUsername(randomName);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
