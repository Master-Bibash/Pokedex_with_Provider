import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/HomePage/Pokedex/components/Pokemon_Info/Pokemon_details.dart';
import 'package:flutter_application_1/widget/constant.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({
    super.key,
    required this.widget,
  });

  final PokemonScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Height'),
            SizedBox(height: 20),
            Text('Weight'),
            SizedBox(height: 20),
            Text('Ability'),
          ],
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (widget.pokemon.height! / 10).toString() + ' cm',
              ),
              const SizedBox(height: 20),
              Text(
                (widget.pokemon.weight! / 10).toString() + ' kg',
              ),
              const SizedBox(height: 20),
              Wrap(
                children: widget.pokemon.abilities!
                    .map(
                      (e) => Container(
                        margin: const EdgeInsets.only(
                          right: 10,
                          bottom: 10,
                        ),
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                          color: getBackGroundColor(
                            widget.pokemon.types![0].type!.name!,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          e.ability!.name!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
