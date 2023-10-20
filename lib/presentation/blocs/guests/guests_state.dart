part of 'guests_bloc.dart';

enum GuestsFilter { all, confirmed, unconfirmed }

sealed class GuestsState extends Equatable {
  final GuestsFilter filter;
  final List<Todo> guests;

  const GuestsState({
    this.filter = GuestsFilter.all,
    this.guests = const <Todo>[],
  });

  int get howManyGuests => guests.length;

  List<Todo> get filteredGuests {
    switch (filter) {
      case GuestsFilter.all:
        return guests;
      case GuestsFilter.confirmed:
        return guests.where((guest) => guest.done).toList();
      case GuestsFilter.unconfirmed:
        return guests.where((guest) => !guest.done).toList();
      default:
        return throw Exception('Unknown filter: $filter');
    }
  }

  int get howManyFilteredGuests => filteredGuests.length;
}

class GuestsInitial extends GuestsState {
  const GuestsInitial(
      {GuestsFilter filter = GuestsFilter.all,
      List<Todo> guests = const <Todo>[]})
      : super(filter: filter, guests: guests);

  @override
  List<Object> get props => [];
}

class CustomGuestsFilter extends GuestsState {
  const CustomGuestsFilter(
      {GuestsFilter filter = GuestsFilter.all,
      List<Todo> guests = const <Todo>[]})
      : super(filter: filter, guests: guests);

  @override
  List<Object> get props => [filter, guests];
}
