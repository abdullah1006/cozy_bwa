import 'package:cozy/providers/space_provider.dart';
import 'package:cozy/widgets/space_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class FavoritPage extends StatefulWidget {
  FavoritPage({Key? key}) : super(key: key);

  @override
  _FavoritPageState createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    final data =
        spaceProvider.spaceList.where((item) => item.isFavorite).toList();
    int index = 0;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          top: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Favorite Space',
              style: blackTextStyle.copyWith(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              child: (data.isEmpty)
                  ? Center(
                      child: Text('Belum ada yang ditambahkan'),
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
                    ),
            )
          ],
        ),
      )),
    );
  }
}
