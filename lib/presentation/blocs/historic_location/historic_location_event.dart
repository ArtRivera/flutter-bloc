part of 'historic_location_bloc.dart';

sealed class HistoricLocationEvent extends Equatable {
  const HistoricLocationEvent();
}


final class NewLocationEvent extends HistoricLocationEvent {
  final List<(double latitude, double longitude)> location;

  const NewLocationEvent(this.location);

  @override
  List<Object> get props => [location];

}
