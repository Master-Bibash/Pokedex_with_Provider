import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/HomePage/HomeComponents/utils/MiddlePart.dart';
import 'package:flutter_application_1/presentation/HomePage/HomeComponents/widgets/CardItem.dart';

import 'package:flutter_application_1/presentation/HomePage/HomeComponents/widgets/HeaderWidget.dart';
import 'package:flutter_application_1/presentation/HomePage/HomeComponents/widgets/ListNews.dart';


class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});
  static String routeName = '/MainHome-screen';

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          slivers: [
            // header
            const headerWidget(),

            // searchHeader
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 20),
                height: 60,
                width: double.infinity,
                child: SearchBar(
                  onTap: () {
                    setState(() {
                      _selected = !_selected;
                    });
                  },
                  leading: const Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                    size: 28,
                    // shadows: [Shadow(color: Colors.black)],
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  elevation: MaterialStateProperty.all(0.06),
                  hintText: "Search Pokemon, Movie, Ability etc",
                  hintStyle: MaterialStateProperty.all(
                    TextStyle(
                      color: Colors.black.withOpacity(0.3),
                      wordSpacing: 3,
                    ),
                  ),
                  backgroundColor: _selected
                      ? MaterialStateProperty.all(
                          Colors.white.withOpacity(0.78)
                              .withOpacity(0.04))
                      : MaterialStateProperty.all(
                          Colors.white.withOpacity(0.78),
                        ),
                ),
              ),
            ),

            // Other slivers, like CardItemsView, MiddlePart, ListNews
            CardItemsView(),
            MiddlePart(),
            ListNews(),
          ],
        ),
      ),
    );
  }
}
