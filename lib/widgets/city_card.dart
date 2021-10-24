import '../models/city.dart';
import '../theme.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final City city;
  //*Untuk Mengambil Constructor dari kelas city
  //*Kemudian dipasang di widget CityCard
  CityCard(this.city);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Container(
          color: const Color(0xffF6F7F8),
          height: 150,
          width: 120,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Image.asset(
                    city.imageUrl!,
                    height: 102,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                  city.isPopular
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.only(left: 9, bottom: 2),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(36),
                              ),
                            ),
                            width: 50,
                            height: 30,
                            child: Image.asset(
                              'assets/icon/icon_star.png',
                              width: 22,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              const SizedBox(
                height: 11,
              ),
              Text(
                city.name!,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
