import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/models/pokemon_model.dart';

import 'package:pokedex/services/rest_api.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final RestPoke _restPoke;

  //*Estado Inicial
  PokemonBloc(this._restPoke) : super(LoadingState()) {
    on<LoadPokemonEvent>((event, emit) async {
      emit(LoadingState());

      try {
        //**Data Cargada */
        final pokemons = await _restPoke.getPokemons();
        emit(LoadedState(pokemons: pokemons));
      } catch (e) {
        emit(ErrorState(error: e.toString()));
      }
    });
  }
}
