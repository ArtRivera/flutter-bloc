import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<HistoricLocationBloc, HistoricLocationState>(
            builder: (context, state) {
          return Text(
            "Ubicaciones: ${state.howManyLocations}",
          );
        }),
      ),
      body: BlocBuilder<HistoricLocationBloc, HistoricLocationState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.howManyLocations,
            itemBuilder: (context, index) {
              final location = state.location[index];
              final (latitude, longitude) = location;
              return ListTile(
                title: Text("Lat: $latitude, Long: $longitude"),
              );
            },
          );
        },
      ),
    );
  }
}
