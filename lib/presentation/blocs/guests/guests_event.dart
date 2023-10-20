part of 'guests_bloc.dart';

sealed class GuestsEvent extends Equatable {
  const GuestsEvent();

  @override
  List<Object> get props => [];
}

final class SetAllGuestsFilterEvent extends GuestsEvent {}

final class SetConfirmedFilterEvent extends GuestsEvent {}

final class SetUnconfirmedFilterEvent extends GuestsEvent {}

final class SetCustomFilterEvent extends GuestsEvent {
  final GuestsFilter filter;
  const SetCustomFilterEvent(this.filter);
}

final class AddGuestEvent extends GuestsEvent {
  final Todo guest;
  const AddGuestEvent(this.guest);

  @override
  List<Object> get props => [guest];
}

final class ToggleGuestEvent extends GuestsEvent {
  final List<Todo> guests;
  const ToggleGuestEvent(this.guests);

  @override
  List<Object> get props => [guests];
}
