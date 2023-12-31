import 'package:flutter/material.dart';

class headerWidget extends StatelessWidget {
  const headerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RichText(
            softWrap: true,
            text: const TextSpan(children: [
              TextSpan(
                  text: "What Pokemon",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                  text: "\nare you looking for?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ))
            ])),
      ),
    );
  }
}
