import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:pokedex/models/pokemon_model.dart';

class RestPoke {
  final String baseUrl =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  Future getPokemons() async {
    final response = await http.get(Uri.parse(baseUrl));

    try {
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body)["pokemon"];
        print(data);
        return data.map((e) => Pokemon.fromMap(e)).toList();
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
