import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  final void Function((double latitude, double longitude))?
      storeNewLocationInHistoric;

  GeolocationCubit({this.storeNewLocationInHistoric})
      : super(GeolocationInitial());

  Future<void> checkGeolocationPermission() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    LocationPermission locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
    }

    final isPermissionGranted =
        locationPermission == LocationPermission.whileInUse ||
            locationPermission == LocationPermission.always;

    emit(GeolocationGranted(
      isServiceEnabled: serviceEnabled,
      isPermissionGranted: isPermissionGranted,
    ));
  }

  void watchUserLocation() async {
    await checkGeolocationPermission();
    if (!state.isServiceEnabled || !state.isPermissionGranted) {
      return;
    }

    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 0,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((position) {
      final newLocation = (position.latitude, position.longitude);

      emit(NewGeolocation(location: newLocation));

      storeNewLocationInHistoric?.call(newLocation);
    });
  }
}
