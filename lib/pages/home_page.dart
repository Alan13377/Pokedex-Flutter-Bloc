import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/blocs/pokemon/pokemon_bloc.dart';

import '../models/pokemon_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //*Llamado al Bloc */
    return BlocProvider(
      create: (context) =>
          PokemonBloc(RepositoryProvider.of(context))..add(LoadPokemonEvent()),
      child: Scaffold(
        //**Acceso al estado */
        body: BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is LoadedState) {
            final List<Pokemon> pokemons = state.pokemons;
            return Container(
              margin: EdgeInsets.all(10),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: pokemons.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: pokemons[index].type?[0] == "Grass" ||
                                  pokemons[index].type == "Poison"
                              ? Colors.greenAccent
                              : pokemons[index].type?[0] == "Fire"
                                  ? Colors.redAccent
                                  : pokemons[index].type?[0] == "Water"
                                      ? Colors.blueAccent
                                      : pokemons[index].type?[0] == "Flying"
                                          ? Colors.grey
                                          : pokemons[index].type?[0] == "Ice"
                                              ? Colors.blue
                                              : pokemons[index].type?[0] ==
                                                      "Poison"
                                                  ? Colors.purpleAccent
                                                  : pokemons[index].type?[0] ==
                                                          "Electric"
                                                      ? Colors.amber
                                                      : pokemons[index]
                                                                  .type?[0] ==
                                                              "Rock"
                                                          ? Colors.grey
                                                          : pokemons[index].type?[
                                                                      0] ==
                                                                  "Bug"
                                                              ? Colors
                                                                  .lightGreen
                                                              : pokemons[index]
                                                                              .type?[
                                                                          0] ==
                                                                      "Ghost"
                                                                  ? Colors
                                                                      .deepPurpleAccent
                                                                  : pokemons[index].type?[
                                                                              0] ==
                                                                          "Ground"
                                                                      ? Colors
                                                                          .brown
                                                                      : pokemons[index].type?[0] ==
                                                                              "Normal"
                                                                          ? Colors
                                                                              .blueGrey
                                                                          : pokemons[index].type?[0] == "Fighting"
                                                                              ? Colors.orange
                                                                              : pokemons[index].type?[0] == "Psychic"
                                                                                  ? Colors.indigo
                                                                                  : Colors.white),
                      alignment: Alignment.center,
                      child: Column(children: [
                        Image(
                            image: NetworkImage(pokemons[index].img as String)),
                        Text(
                          pokemons[index].name as String,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(pokemons[index].id.toString()),
                        Text(pokemons[index].type.toString()),
                      ]),
                    );
                  }),
            );
          }

          if (state is ErrorState) {
            return Center(
              child: Text("Error"),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
