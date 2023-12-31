// import 'package:flutter/foundation.dart';
// import 'package:flutter_application_1/model/PokemonModel.dart';
// import 'package:flutter_application_1/model/pokemonDetailModel.dart';
// import 'package:flutter_application_1/state_management/Cubit/state/PokemonSate.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;

// class PokemonCubit extends Cubit<PokemonState> {
//   final String _baseURL =
//       'https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0';
//   PokemonsModel _pokemons = PokemonsModel();
//   List<PokemonDetailModel> _pokemonDetail = [];

//   PokemonCubit() : super(PokemonInitial());

//   Future<void> getPokemons() async {
//     emit(PokemonLoadInProgress());
//     try {
//       final response = await http.get(Uri.parse(_baseURL));
//       final data = pokemonsModelFromJson(response.body);

//       if (response.statusCode == 200) {
//         _pokemons = data;
//         emit(PokemonLoadSuccess(pokemon: _pokemons));

//         for (var result in _pokemons.results!) {
//           await getPokemonDetail(resultUrl: result.url!);
//         }
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//       emit(PokemonPageLoadFailed(error: e.toString()));
//     }
//   }

//   Future<void> _getMorePokemons() async {
//     try {
//       final response = await http.get(Uri.parse(_pokemons.next!));
//       final data = pokemonsModelFromJson(response.body);

//       if (response.statusCode == 200) {
//         _pokemons = data;
//         emit(PokemonLoadSuccess(pokemon: _pokemons));

//         for (var result in _pokemons.results!) {
//           await getPokemonDetail(resultUrl: result.url!);
//         }
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//       emit(PokemonPageLoadFailed(error: e.toString()));
//     }
//   }

//   Future<void> getPokemonDetail({required String resultUrl}) async {
//     try {
//       final response = await http.get(Uri.parse(resultUrl));
//       final data = pokemonDetailModelFromJson(response.body);

//       if (response.statusCode == 200) {
//         _pokemonDetail.add(data); // Add the PokemonDetailModel to the list
//         emit(PokemonLoadSuccess(pokemon: _pokemons));
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//       emit(PokemonPageLoadFailed(error: e.toString()));
//     }
//   }

//   void getMorePokemons() => _getMorePokemons();
// }

import 'package:bloc/bloc.dart';

class FavouriteCubit extends Cubit<List<int>> {
  FavouriteCubit() : super([]);

  void toggleFavourite(int item) {
    final List<int> currentFavorites = state;

    if (currentFavorites.contains(item)) {
      emit(List.from(currentFavorites)..remove(item));
    } else {
      emit(List.from(currentFavorites)..add(item));
    }
  }
}

