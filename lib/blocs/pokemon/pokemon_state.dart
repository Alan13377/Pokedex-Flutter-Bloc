// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

//**Loading State */

class LoadingState extends PokemonState {
  @override
  List<Object> get props => [];
}

//**Loaded State */
class LoadedState extends PokemonState {
  final List<Pokemon> pokemons;
  LoadedState({
    required this.pokemons,
  });

  @override
  List<Object> get props => [pokemons];
}

//**Error state */
class ErrorState extends PokemonState {
  final String error;
  ErrorState({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
