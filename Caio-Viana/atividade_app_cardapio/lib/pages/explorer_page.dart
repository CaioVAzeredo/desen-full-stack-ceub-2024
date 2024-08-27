import 'package:atividade2_sala/componentes/category_section.dart';
import 'package:atividade2_sala/componentes/restaurant_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/explorer_data.dart';
import '../componentes/post_section.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late MockService mockService;

  @override
  void initState() {
    super.initState();
    mockService = MockService();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final restaurants = snapshot.data?.restaurants ?? [];
          final categories = snapshot.data?.categories ?? [];
          final posts = snapshot.data?.friendPosts ?? [];
          return ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              //RestaurantSection
              RestaurantSection(restaurants: restaurants),
              //CategorySection
              CategorySection(categories: categories),
              //PostSection
              PostSection(posts: posts),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}


