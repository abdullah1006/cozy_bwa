import '../models/city.dart';
import '../widgets/city_card.dart';
import 'package:flutter/material.dart';

class PopularCities extends StatelessWidget {
  const PopularCities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(
            width: 24,
          ),
          CityCard(
            City(
              id: 1,
              name: 'Jakarta',
              imageUrl: 'assets/images/city1.png',
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          CityCard(
            City(
              id: 2,
              name: 'Bandung',
              imageUrl: 'assets/images/city2.png',
              isPopular: true,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          CityCard(
            City(
              id: 3,
              name: 'Surabaya',
              imageUrl: 'assets/images/city3.png',
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          CityCard(
            City(
              id: 4,
              name: 'Palembang',
              imageUrl: 'assets/images/city4.png',
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          CityCard(
            City(
              id: 5,
              name: 'Aceh',
              imageUrl: 'assets/images/city5.png',
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          CityCard(
            City(
              id: 6,
              name: 'Bogor',
              imageUrl: 'assets/images/city6.png',
            ),
          ),
          const SizedBox(
            width: 24,
          ),
        ],
      ),
    );
  }
}
