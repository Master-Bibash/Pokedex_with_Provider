import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/presentation/HomePage/Pokedex/components/Pokemon_Info/Pokemon_details.dart';
import 'package:flutter_application_1/presentation/HomePage/Pokedex/components/cardWidget.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_application_1/state_management/Cubit/state/Pokemon_Provider.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

// import '../../../model/PokemonDetailModel.dart';
// import 'components/Pokemon_Info.dart/Pokemon_details.dart';

class PokeDexScreen extends StatefulWidget {
  const PokeDexScreen({Key? key}) : super(key: key);

  static String routeName = '/pokedex-screen';

  @override
  State<PokeDexScreen> createState() => _PokeDexScreenState();
}

class _PokeDexScreenState extends State<PokeDexScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    const duration = Duration(seconds: 5);
    _controller = AnimationController(vsync: this, duration: duration);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.repeat();
    super.initState();
  }

  // late final AnimationController _controller =
  //     AnimationController(vsync: this, duration: const Duration(seconds: 2))
  //       ..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  IconData? icon = Icons.add;
  String? _text;
  bool isAdd = true;

  @override
  Widget build(BuildContext context) {
    // context.read<PokemonBloc>().add(PokemonPageRequest(page: 0));

    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        floatingActionButton: SpeedDial(
          backgroundColor: Colors.blue,
          activeBackgroundColor: Colors.red,
          foregroundColor: Colors.green,
          visible: true,
          elevation: 10,
          onOpen: () {
            setState(() {
              icon = Icons.close;
            });
          },
          onClose: () {
            setState(() {
              icon = null;
            });
          },
          child: Icon(
            icon ?? Icons.menu,
            color: Colors.white,
          ),
          children: [
            SpeedDialChild(
              child: const Icon(Icons.search_outlined),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              label: 'Search',
              onTap: () {
                setState(() {
                  _text = 'You pressed \"All type!"';
                });
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.bolt_rounded),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              label: 'All gen!',
              onTap: () {
                setState(() {
                  _text = 'You pressed \"All type!"';
                });
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.settings),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              label: 'All type!',
              onTap: () {
                setState(() {
                  _text = 'You pressed \"All type!"';
                });
              },
            ),
            SpeedDialChild(
              child: const Icon(
                Icons.favorite_outlined,
                color: Colors.blue,
                size: 30,
              ),
              foregroundColor: Colors.blue,
              // backgroundColor: Colors.transparent,
              label: 'Favourite pokemon',
              onTap: () {
                setState(() {
                  _text = 'You pressed\"Favourite\ pokemon\"';
                });
              },
            ),
          ],
        ),
        body: CustomScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            slivers: [
              SliverAppBar(
                  expandedHeight: 200.0,
                  automaticallyImplyLeading: false,
                  floating: false,
                  pinned: false,
                  backgroundColor: Color(0xFFF5F5F5),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      textDirection: TextDirection.ltr,
                      children: [
                        Positioned(
                            right: -100,
                            top: -90,
                            height: 300,
                            child: RotationTransition(
                              turns: _animation,
                              child: Image.asset(
                                "assets/image/pokeball.png",
                                color: Colors.black12.withOpacity(0.19),
                              ),
                            )),
                        Positioned(
                          right: 17,
                          top: 28,
                          child: IconButton(
                            onPressed: () {},
                            icon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.menu,
                                size: 35,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            left: 10,
                            top: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    size: 27,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Pokedex",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  )),
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: FutureBuilder(
                    future: context.read<PokemonProvider>().getPokemons(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == 200)
                        Center(
                          child: CircularProgressIndicator(),
                        );
                      else {
                        return Consumer<PokemonProvider>(
                            builder: (context, pokemon, _) => GridView.count(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 1,
                                  childAspectRatio: 1.2,
                                  children: pokemon.pokemonsDetail
                                      .map((pokemon) => CardWidget(
                                        connection: snapshot,
                                          pokemon: pokemon,
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  PokemonScreen(
                                                      pokemon: pokemon),
                                            ));
                                          }))
                                      .toList(),
                                )
                                );
                      }
                      return Container();
                    },
                  ),
                ),
              )
              // SliverPadding(
              //   padding: const EdgeInsets.all(9),
              //   sliver: SliverGrid(
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //       mainAxisSpacing: 5,
              //       crossAxisSpacing: 1,
              //       childAspectRatio: 1.2,
              //     ),
              //     delegate: SliverChildBuilderDelegate((context, index) {
              //       return FutureBuilder(
              //           future: context.read<PokemonProvider>().getPokemons(),
              //           builder: (context, snapshot) {
              //             if (snapshot.connectionState == 200) {
              //               return Center(
              //                 child: CircularProgressIndicator(),
              //               );
              //             } else {
              //               return Consumer<PokemonProvider>(
              //                 builder: (context, pokemon, _) => GridView.count(
              //                   crossAxisCount: 2,
              //                   children: pokemon.pokemonsDetail
              //                       .map((pokemons) => CardWidget(
              //                         onTap: (){},
              //                         pokemon: pokemons,

              //                       ))
              //                       .toList(),
              //                 ),
              //               );
              //             }
              //           });
              //     }),
              //   ),
              // )
            ]));
  }

// class PokemonListScreen extends StatelessWidget {
//   static String routeName = '/pokedex-screen';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<PokemonCubit, PokemonState>(
//         builder: (context, state) {
//           if (state is PokemonInitial) {
//             // Handle the initial state, for example, by triggering the loading
//             // of Pokemon data in your Cubit
//             context.read<PokemonCubit>().getPokemons();
//             return CircularProgressIndicator(); // You can show a loading indicator or initial content
//           } else if (state is PokemonLoadInProgress) {
//             return CircularProgressIndicator();
//           } else if (state is PokemonLoadSuccess) {
//             final pokemons = state.pokemon.results ?? [];

//             return ListView.builder(
//               itemCount: pokemons.length,
//               itemBuilder: (context, index) {
//                 var pokemon = pokemons[index];
//                 return ListTile(
//                   title: Text(pokemon.name ?? 'Unknown Pokemon'),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => PokemonDetailScreen(
//                           pokemonUrl: pokemon.url ?? '',
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           } else if (state is PokemonPageLoadFailed) {
//             return Text("Failed to load data: ${state.error}");
//           } else {
//             // Handle any other unknown state here
//             return Text("Unknown state: $state");
//           }
//         },
//       ),
//     );
//   }
// }

// class PokemonDetailScreen extends StatelessWidget {
//   final String pokemonUrl;

//   PokemonDetailScreen({required this.pokemonUrl});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PokemonCubit, PokemonState>(
//       builder: (context, state) {
//         if (state is PokemonLoadSuccess) {
//           var pokemonDetail = state.pokemon.results!
//               .firstWhere((detail) => detail.url == pokemonUrl);

//           return Scaffold(
//             appBar: AppBar(
//               title: Text(pokemonDetail.name!),
//             ),
//             body: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Image.network(
//                 //   // Assuming you have an 'officialArtwork' property in PokemonDetailModel
//                 //   pokemonDetail.sprites?.other?.officialArtwork?.frontDefault ?? '',
//                 //   height: 200,
//                 //   width: 200,
//                 // ),
//                 // SizedBox(height: 20),
//                 // Text("Height: ${pokemonDetail.height ?? 'N/A'}"),
//                 // Text("Weight: ${pokemonDetail.weight ?? 'N/A'}"),
//                 // Add more details as needed
//               ],
//             ),
//           );
//         } else {
//           return CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }
//   Widget _buildShimmerEffect() {
//     return Shimmer.fromColors(
//       direction: ShimmerDirection.ttb,
//       period: Duration(seconds: 2),
//       baseColor: Colors.grey[300]!,
//       highlightColor: Colors.grey[100]!,
//       child: GridView.count(
//         crossAxisCount: 2,
//         mainAxisSpacing: 5,
//         crossAxisSpacing: 1,
//         childAspectRatio: 1.2,
//         children: List.generate(
//           6, // Number of shimmering items
//           (index) => CardWidgetShimmer(), // Create a shimmering placeholder
//         ),
//       ),
//     );
//   }
// }

// class CardWidgetShimmer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       // Customize the appearance of the shimmering card
//       child: Shimmer.fromColors(
//         baseColor: Colors.grey[300]!,
//         highlightColor: Colors.grey[100]!,
//         child: Container(
//           // Customize the appearance of the shimmering container
//           width: double.infinity,
//           height: double.infinity,
//         ),
//       ),
//     );
//   }
// }
}
