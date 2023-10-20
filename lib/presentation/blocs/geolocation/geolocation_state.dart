part of 'geolocation_cubit.dart';

sealed class GeolocationState extends Equatable {
  final (double latitude, double longitude) location;
  final bool isServiceEnabled;
  final bool isPermissionGranted;

  const GeolocationState({
    this.location = (0.0, 0.0),
    this.isServiceEnabled = false,
    this.isPermissionGranted = false,
  });
}

class GeolocationInitial extends GeolocationState {
  @override
  List<Object> get props => [location, isServiceEnabled, isPermissionGranted];
}

class GeolocationGranted extends GeolocationState {
  const GeolocationGranted({
    required bool isServiceEnabled,
    required bool isPermissionGranted,
  }) : super(
            isPermissionGranted: isPermissionGranted,
            isServiceEnabled: isServiceEnabled);

  @override
  List<Object> get props => [isServiceEnabled, isPermissionGranted];
}

class NewGeolocation extends GeolocationState {
  const NewGeolocation({required (double, double) location}) : super(location: location);

  @override
  List<Object> get props => [location];
}
