part of 'historic_location_bloc.dart';

sealed class HistoricLocationState extends Equatable {
  final List<(double latitude, double longitude)> location;

  get howManyLocations => location.length;

  const HistoricLocationState({
    this.location = const [(0.0, 0.0)],
  });
}

class HistoricLocationInitialState extends HistoricLocationState {
  const HistoricLocationInitialState();

  @override
  List<Object> get props => [location];
}

class NewHistoricLocationState extends HistoricLocationState {
  const NewHistoricLocationState({
    required location,
  }) : super(location: location);

  @override
  List<Object> get props => [location];
}
