import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'guests_event.dart';

part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc() : super(GuestsInitial(guests: [
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
  ])) {



    on<SetCustomFilterEvent>((event, emit) {
      emit(CustomGuestsFilter(filter: event.filter, guests: state.guests));
    });

    on<AddGuestEvent>((event, emit) {
      emit(CustomGuestsFilter(filter: state.filter, guests: [...state.guests, event.guest]));
    });

    on<ToggleGuestEvent>((event, emit) {
      emit(CustomGuestsFilter(filter: state.filter, guests: event.guests));
    });
  }

  void changeFilter(GuestsFilter newFilter) {
    add(SetCustomFilterEvent(newFilter));
  }

  void addGuest(String guestName) {
    final newGuest = Todo(
      id: uuid.v4(),
      description: guestName,
      completedAt: null,
    );
    add(AddGuestEvent(newGuest));
  }

  void toggleGuest(Todo newGuest) {

    final newGuestId = newGuest.id;

    final newGuests = state.guests.map((guest) {
      if (guest.id == newGuestId) {
        return Todo(id: newGuestId, description: guest.description, completedAt: guest.completedAt == null ? DateTime.now() : null);
      }
      return guest;
    }).toList();

    add(ToggleGuestEvent(newGuests));
  }
}
