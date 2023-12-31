import 'package:flutter/material.dart';
import 'package:flutter_application_1/state_management/Cubit/FavouriteCubit.dart';
import 'package:flutter_application_1/state_management/Cubit/state/Pokemon_Provider.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'presentation/HomePage/Mainhome.dart';
import 'presentation/HomePage/Pokedex/PokedexHomePage.dart';
import 'presentation/splash/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final pokemonDetailsCubit = PokemonDetailsCubit();
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FavouriteCubit(),
          ),
                ChangeNotifierProvider<PokemonProvider>(
              create: (_) => PokemonProvider())

        ],
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'Roboto'),
          debugShowCheckedModeBanner: false,
          routes: {
            //include exclude
            SplashScreen.routeName: (context) => const SplashScreen(),
            MainHomePage.routeName: (context) => const MainHomePage(),
            PokeDexScreen.routeName: (context) => PokeDexScreen(),
          },
          initialRoute: SplashScreen.routeName,
        ));
  }
}

