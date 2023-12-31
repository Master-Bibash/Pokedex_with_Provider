import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/pokemonDetailModel.dart';
import 'package:flutter_application_1/presentation/HomePage/Pokedex/components/widget/aboutpokemon.dart';
import 'package:flutter_application_1/state_management/Cubit/FavouriteCubit.dart';
import 'package:flutter_application_1/widget/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key, required this.pokemon});

  final PokemonDetailModel pokemon;

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 2))
        ..repeat();
  void init(TickerProvider tickerProvider) {
    _tabController = TabController(length: 2, vsync: tickerProvider);
  }

  @override
  void initState() {
    // TODO: implement initState

    _tabController = TabController(length: 2, vsync: this);

    init(this);

    super.initState();
  }

  void dispose() {
    // Dispose of the TabController to free up resources
    _tabController!.dispose();
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favouriteCubit = context.read<FavouriteCubit>();
    return Scaffold(
        backgroundColor:
            getBackGroundColor(widget.pokemon.types![0].type!.name!),
        body: CustomScrollView(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          slivers: [
            SliverAppBar(
                backgroundColor:
                    getBackGroundColor(widget.pokemon.types![0].type!.name!),
                expandedHeight: 200.0,
                automaticallyImplyLeading: false,
                floating: false,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                  textDirection: TextDirection.ltr,
                  children: [
                    BlocBuilder<FavouriteCubit, List<int>>(
                      builder: (context, state) {
                        print("the state is $state");
                        final isFav = state.contains(widget.pokemon.id!);
                        print("the isFav is $isFav");

                        return Positioned(
                            right: 17,
                            top: 28,
                            child: IconButton(
                              onPressed: () {
                                favouriteCubit
                                    .toggleFavourite(widget.pokemon.id!);
                              },
                              icon: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                size: 35,
                                color: isFav
                                    ? Colors.red.withOpacity(0.7)
                                    : Colors.white.withOpacity(0.7),
                              ),
                            ));
                      },
                    ),
                    Positioned(
                        left: 17,
                        top: 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 27,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            Text(
                              widget.pokemon.name![0].toUpperCase() +
                                      widget.pokemon.name!.substring(1) ??
                                  'Unknwon Pokemon',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: widget.pokemon.types!
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Chip(
                                          elevation: 0,
                                          side: BorderSide(
                                              color: Colors.transparent
                                                  .withOpacity(0.07)),
                                          color: MaterialStateProperty.all(
                                              getBackGroundColor(widget.pokemon
                                                  .types![0].type!.name!)),
                                          backgroundColor: getBackGroundColor(
                                              widget.pokemon.types![0].type!
                                                  .name!),
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          label: Container(
                                            width: 75,
                                            height: 26,
                                            alignment: Alignment.center,
                                            child: Text(
                                              e.type!.name.toString(),
                                              style: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList()),
                          ],
                        )),
                    Positioned(
                        top: 150,
                        right: 15,
                        child: Text(
                          "#00${widget!.pokemon!.id}",
                          style: TextStyle(
                              fontSize: 23,
                              letterSpacing: 1.3,

                              // wordSpacing: 2.9,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ))
                  ],
                ))),
            SliverFillRemaining(
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    right: 10,
                    width: 220,
                    height: 220,
                    child: AnimatedBuilder(
                        animation: _controller,
                        builder: (_, child) {
                          return Transform.rotate(
                              angle: _controller!.value * 2 * math.pi,
                              child: Image.asset("assets/image/pokeball.png"));
                        },
                        child: Image.asset("assets/image/pokeball.png")),
                  ),
                  Positioned(
                    top: 40,
                    left: 30,
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/image/spots.png"),
                  ),
                  Positioned.fill(
                    top: 200,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 70,
                          ),
                          // Moved DefaultTabController to wrap the entire Column
                          DefaultTabController(
                            length: 4,
                            child: Column(
                              children: [
                                TabBar(
                                  unselectedLabelColor: Colors.black38,
                                  controller: _tabController,
                                  dividerColor: Colors.transparent,
                                  labelColor: Colors.black,
                                  indicatorColor: Colors.blue,
                                  padding: EdgeInsets.all(10),
                                  labelPadding: EdgeInsets.all(10),
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  tabs: [
                                    Text(
                                      "About",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                      ),
                                    ),
                                    Text(
                                      "Base Stats",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller:
                                  _tabController, // Provide the TabController
                              children: [
                                // Widgets for Tab 1

                                AboutWidget(widget: widget),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: widget.pokemon.stats!
                                      .map((e) => Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 20,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(e.stat!.name!),
                                                Row(
                                                  children: [
                                                    Text(e.baseStat.toString()),
                                                    LinearPercentIndicator(
                                                      width: 175,
                                                      lineHeight: 10,
                                                      percent: (e.baseStat! /
                                                                      100)
                                                                  .toDouble() >
                                                              1
                                                          ? 1
                                                          : (e.baseStat! / 100)
                                                              .toDouble(),
                                                      backgroundColor:
                                                          Colors.grey.shade300,
                                                      progressColor:
                                                          (e.baseStat! / 100)
                                                                      .toDouble() <
                                                                  0.50
                                                              ? Colors.red
                                                              : Colors.green,
                                                      barRadius:
                                                          const Radius.circular(
                                                              10),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                ),
                                // Add more widgets as needed
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -16,
                    left: 80,
                    width: 320,
                    height: 310,
                    child: Hero(
                      tag: widget.pokemon.id!,
                      child: Image.network(widget.pokemon.sprites!.other!
                          .officialArtwork!.frontDefault!),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
