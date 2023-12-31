import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/pokemonDetailModel.dart';
import 'package:flutter_application_1/widget/constant.dart';
import 'package:shimmer/shimmer.dart';

class CardWidget extends StatelessWidget {
   CardWidget({
    super.key,
    required this.pokemon,
    required this.onTap,
    required this.connection
  });
  final PokemonDetailModel pokemon;
  final VoidCallback onTap;
   AsyncSnapshot<dynamic> connection;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: getBackGroundColor(pokemon.types![0].type!.name!),
        child: Stack(
          children: [
            Positioned(
              right: -13,
              bottom: -10,
              width: 108,
              height: 108,
              child: CircleAvatar(
                backgroundColor:
                    getBackGroundColor(pokemon.types![0].type!.name!),
                child: Image.asset(
                  "assets/image/pokeball.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                right: 6,
                bottom: -7,
                width: 105,
                height: 110,
                child: Hero(
                  tag: pokemon.id!,
                  child:
                  connection.connectionState!=ConnectionState.waiting ?
                   CircularProgressIndicator():
                   Image.network(
                    pokemon.sprites!.other!.officialArtwork!.frontDefault!,
                  ),
                )),
            Positioned(
                child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pokemon.name![0].toUpperCase() +
                                  pokemon.name!.substring(1) ??
                              'Unknwon Pokemon',
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "#00${pokemon!.id}",
                          style: TextStyle(
                              fontSize: 23,
                              letterSpacing: 1.3,

                              // wordSpacing: 2.9,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.2)),
                        )
                      ],
                    ),
                    Column(
                        children: pokemon.types!
                            .map(
                              (pokemonDetails) => Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Chip(
                                  // key: ValueKey<String>('unique_card_$index'),
                                  elevation: 0,
                                  side: const BorderSide(
                                      color: Colors.transparent),
                                  color: MaterialStateProperty.all(
                                    getBackGroundColor(
                                        pokemon.types![0].type!.name!),
                                  ),
                                  backgroundColor: getBackGroundColor(
                                      pokemon.types![0].type!.name!),
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  label: Container(
                                    width: 39,
                                    height: 18,
                                    alignment: Alignment.center,
                                    child: Text(
                                      pokemonDetails.type!.name!,
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList()),
                  ]),
            ))
          ],
        ),
      ),
    );
  }
}
