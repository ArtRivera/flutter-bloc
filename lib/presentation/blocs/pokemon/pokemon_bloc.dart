import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pokemon_event.dart';

part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final Future<String> Function(int) _fetchPokemonName;

  PokemonBloc({
    required Future<String> Function(int) fetchPokemonName,
  })  : _fetchPokemonName = fetchPokemonName,
        super(PokemonInitial()) {
    on<AddPokemonEvent>((event, emit) async {
      emit(AddedPokemon(pokemonList: event.pokemonList));
    });
  }

  Future<String> savePokemon(int id) async {
    if (state.pokemonList.containsKey(id)) {
      return state.pokemonList[id] ?? 'Pokemon not found in Bloc';
    }
    final newPokemonName = await _fetchPokemon(id);
    _storePokemon(id: id, name: newPokemonName);
    return newPokemonName;
  }

  void _storePokemon({required int id, required String name}) {
    try {
      final pokemonList = {...state.pokemonList};
      pokemonList[id] = name;
      add(AddPokemonEvent(pokemonList: pokemonList));
    } catch (e) {
      throw Exception('Error storing pokemon with id $id');
    }
  }

  Future<String> _fetchPokemon(int id) async {
    try {
      final pokemonName = await _fetchPokemonName(id);
      return pokemonName;
    } catch (e) {
      throw Exception('Error fetching pokemon with id $id');
    }
  }
}
