import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'historic_location_event.dart';
part 'historic_location_state.dart';

class HistoricLocationBloc extends Bloc<HistoricLocationEvent, HistoricLocationState> {
  HistoricLocationBloc() : super(const HistoricLocationInitialState()) {


    on<NewLocationEvent>((event, emit) async {
      print(state.location.length);
      emit(NewHistoricLocationState(location: event.location));
    });

  }

  void addNewLocation((double latitude, double longitude) location) {

    final newHistoricLocation = [...state.location, location];

    add(NewLocationEvent(newHistoricLocation));
  }


}
