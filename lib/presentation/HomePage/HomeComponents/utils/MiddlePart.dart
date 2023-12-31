import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/HomePage/HomeComponents/utils/PokemonNewsList/PokemonListNews.dart';
import 'package:google_fonts/google_fonts.dart';

SliverToBoxAdapter MiddlePart() {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pokemon News",
            style: TextStyle(
                fontSize: 30,
                fontStyle: GoogleFonts.poppins().fontStyle,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Builder(
            builder: (context) {
              return TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PokemonListNews(),
                    ));
                  },
                  child: Text("View All",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontStyle: GoogleFonts.poppins().fontStyle,
                        fontWeight: FontWeight.bold,
                      )));
            },
          )
        ],
      ),
    ),
  );
}
