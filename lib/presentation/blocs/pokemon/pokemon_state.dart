part of 'pokemon_bloc.dart';

sealed class PokemonState extends Equatable {
  final Map<int, String> pokemonList;

  const PokemonState({
    this.pokemonList =  const <int, String>{},
  });
}

class PokemonInitial extends PokemonState {
  @override
  List<Object> get props => [];
}

class AddedPokemon extends PokemonState {

 const AddedPokemon({
    Map<int, String> pokemonList = const <int, String>{},
  }) : super(pokemonList: pokemonList);

  @override
  List<Object> get props => [pokemonList];
}
