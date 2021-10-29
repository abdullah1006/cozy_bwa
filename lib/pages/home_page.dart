import '../models/tips.dart';
import '../providers/space_provider.dart';
import '../theme.dart';
import '../view/popular_cities.dart';

import '../widgets/space_card.dart';
import '../widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            //NOTE : Bagian Header
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                top: 24,
              ),
              //NOTE : TITLE
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Now',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Mencari kosan yang cozy',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //NOTE : POPULAR CITIES
                  Text(
                    'Popular Cities',
                    style: regularTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            PopularCities(),
            const SizedBox(
              height: 30,
            ),
            //NOTE : RECOMMEND SPACE
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended Space',
                    style: regularTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //NOTE : Recommended Space
                  Consumer<SpaceProvider>(
                    builder: (context, spaceProvider, child) {
                      spaceProvider.getSpaceList();
                      final data = spaceProvider.spaceList;
                      int index = 0;
                      return (spaceProvider.onLoadData)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Column(
                              children: data.map((item) {
                                index++;
                                return Container(
                                  margin: EdgeInsets.only(
                                    top: index == 1 ? 0 : 30,
                                  ),
                                  child: SpaceCard(item),
                                );
                              }).toList(),
                            );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //NOTE : TIPS AND GUIDANCE
                  Text(
                    'Tips and Guidance',
                    style: regularTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TipsCard(
                    Tips(
                        id: 1,
                        title: 'City Guidelines',
                        imageUrl: 'assets/images/tips1.png',
                        updatedAt: '20 Apr'),
                  ),
                  const SizedBox(height: 20),
                  TipsCard(
                    Tips(
                        id: 2,
                        title: 'Jakarta Fairship',
                        imageUrl: 'assets/images/tips2.png',
                        updatedAt: '11 Dec'),
                  ),
                  const SizedBox(height: 115),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
