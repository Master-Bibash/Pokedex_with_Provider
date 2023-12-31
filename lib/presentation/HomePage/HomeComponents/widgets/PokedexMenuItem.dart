
import 'package:flutter/material.dart';


class PokedexMenuItem extends StatelessWidget {
  const PokedexMenuItem({
    super.key,
    required this.text,
    required this.color, required this.onTap,
  });
  final String text;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: color.withAlpha(160),
              blurRadius: 26,
              spreadRadius: -25,
              offset: const Offset(0, 35),
            ),
          ],
        ),
        child: Card(
          color: color,
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              //  big pokeball
              Positioned(
                right: -30,
                width: 100,
                height: 100,
                child: Image.asset(
                  "assets/image/pokeball.png",
                  fit: BoxFit.cover,
                ),
              ),
              // small pokeball
              Positioned(
                top: -50,
                left: -40,
                width: 80,
                height: 80,
                child: Image.asset("assets/image/pokeball.png"),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.7)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



