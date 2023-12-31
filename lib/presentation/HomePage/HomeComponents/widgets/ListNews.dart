import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/HomePage/constants/constant.dart';

class ListNews extends StatelessWidget {
  const ListNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Card(elevation: 0.2, child: pokeNews[index]);
        },
        childCount: 3,
      ),
    );
  }
}
