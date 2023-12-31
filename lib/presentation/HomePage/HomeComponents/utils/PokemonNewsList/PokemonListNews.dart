import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/HomePage/constants/constant.dart';

class PokemonListNews extends StatelessWidget {
  const PokemonListNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   elevation: 5,
        //   title: Transform(
        //     transform: Matrix4.translationValues(-10, 20, 0),
        //     child: Text(
        //       "Pokedex",
        //       style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold,
        //           fontSize: 24,
        //           fontFamily: "Poppins"),
        //     ),
        //   ),
        //   toolbarHeight: MediaQuery.of(context).size.height / 7,
        //   backgroundColor: Color(0xFFFA6454),
        //   shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(40),
        //     bottomRight: Radius.circular(40),
        //   )),
        // ),
        body: CustomScrollView(
          scrollDirection: Axis.vertical,

      slivers: [
       SliverToBoxAdapter(
      
        child: Container(
          padding: const EdgeInsets.only(bottom: 15),
          width: double.infinity,
          height: 100,
          alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
        color:  const Color(0xFFFA6454),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
             bottomRight: Radius.circular(40)
          )
        ),
          child: const Text(
              "Pokedex",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: "Poppins"),
            ),
          

        ),
       ),
        SliverList.builder(
          
          itemCount: pokeNews.length,
          itemBuilder: (context, index) {
            return Card(
              
              child: pokeNews[index]);
          },
        )
      ],
    ));
  }
}
