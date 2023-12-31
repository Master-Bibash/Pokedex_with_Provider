import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PokedexNews extends StatelessWidget {
  const PokedexNews({
    super.key,
    required this.title,
    required this.subtitle,
    required this.img, 
  });
  final String title;
  final String subtitle;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(

          title: Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 20,
                fontStyle: GoogleFonts.poppins().fontStyle,
                // fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.3),
                fontSize: 12,
                // fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          trailing: FadeInImage.assetNetwork(
              placeholder: "assets/image/red.png", image: img)),
    );
  }
}
