import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/HomePage/HomeComponents/widgets/PokedexMenuItem.dart';
import 'package:flutter_application_1/presentation/HomePage/constants/constant.dart';

class CardItemsView extends StatelessWidget {
  const CardItemsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white, // Set a fixed width or use other constraints
        height: MediaQuery.of(context).size.height * 0.46,

        child: GridView.builder(
          shrinkWrap: true,
          itemCount: pokedexMenuItems.length,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            mainAxisExtent: 90,
          ),
          itemBuilder: (context, index) {
            final item = pokedexMenuItems[index];

            return PokedexMenuItem(
              onTap: () {
                Navigator.pushNamed(context, item['route']);
              },
              text: item['label'],
              color: item['color'],
            );
          },
        ),
      ),
    );
  }
}
