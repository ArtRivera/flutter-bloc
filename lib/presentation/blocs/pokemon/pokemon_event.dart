part of 'pokemon_bloc.dart';

sealed class PokemonEvent extends Equatable {
  const PokemonEvent();
}

final class AddPokemonEvent extends PokemonEvent {
  final Map<int, String> pokemonList;

  const AddPokemonEvent({
    required this.pokemonList,
  });

  @override
  List<Object> get props => [pokemonList];
}
