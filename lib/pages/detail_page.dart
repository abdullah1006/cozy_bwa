import 'package:cozy/providers/space_provider.dart';
import 'package:provider/provider.dart';

import '../models/space.dart';
import '../theme.dart';
import '../widgets/facilitiy_item.dart';
import '../widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'error_page.dart';

class DetailPage extends StatefulWidget {
  final Space space;

  DetailPage(this.space);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    //Note: Launch URL
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ErrorPage(),
          ),
        );
      }
    }

    //Note: Alert Dialog
    //TODO : Buat widget show dialog sendiri
    Future<void> _showConfirmation() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Konfirmasi'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Apakah kamu ingin menghubungi pemilik ?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Batal'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Hubungi'),
                onPressed: () {
                  launch("tel:${widget.space.phone!}");
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.space.imageUrl!,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 328,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 24,
                    right: 24,
                  ),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //NOTE: TITLE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.space.name!,
                                style: blackTextStyle.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '\$${widget.space.price}',
                                      style: purpleTextStyle.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' / month',
                                      style: greyTextStyle.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          RatingItem(
                            rating: widget.space.rating,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //NOTE: Main Facilities
                      Text(
                        'Main Facilities',
                        style: regularTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FacilityItem(
                            name: 'kitchen',
                            imageUrl: 'assets/icon/icon_kitchen.png',
                            total: widget.space.numberOfKitchens,
                          ),
                          FacilityItem(
                            name: 'kitchen',
                            imageUrl: 'assets/icon/icon_bedroom.png',
                            total: widget.space.numberOfBedrooms,
                          ),
                          FacilityItem(
                            name: 'Cupboards',
                            imageUrl: 'assets/icon/icon_cupboard.png',
                            total: widget.space.numberOfCupboards,
                          ),
                        ],
                      ),
                      //Note: Title Photos
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Photos',
                        style: regularTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
                //NOTE : LIST VIEW PHOTOS
                SizedBox(
                  height: 88,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: widget.space.photos!.map((item) {
                      return Container(
                        margin: EdgeInsets.only(
                          left: 24,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            item,
                            width: 110,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                //NOTE : LOCATION
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location',
                        style: regularTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${widget.space.address!}\n${widget.space.city}, ${widget.space.country}",
                            style: greyTextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              launchUrl(widget.space.mapUrl!);
                            },
                            child: Image.asset(
                              'assets/icon/btn_map.png',
                              height: 40,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      //NOTE : BUTTON BOOK NOW
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: purpleColor,
                            onPrimary: whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () {
                            _showConfirmation();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/icon/btn_back.png',
                      height: 40,
                    ),
                  ),
                  Consumer<SpaceProvider>(
                    builder: (context, provider, child) => InkWell(
                      onTap: () {
                        provider.setFavorite(widget.space);
                      },
                      child: Image.asset(
                        widget.space.isFavorite
                            ? 'assets/icon/btn_wishlist_select.png'
                            : 'assets/icon/btn_wishlist.png',
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
