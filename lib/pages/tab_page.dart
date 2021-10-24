import '../models/navbar_items.dart';
import '../widgets/navbar_widget.dart';

import 'chat_page.dart';
import 'payment_page.dart';
import '../providers/navbar_provider.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'package:flutter/material.dart';

import 'favorit_page.dart';

class TabPage extends StatefulWidget {
  TabPage({Key? key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  final tabs = [
    HomePage(),
    ChatPage(),
    PaymentPage(),
    FavoritPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var navbarProvider = Provider.of<NavbarProvider>(context);
    return Scaffold(
      body: tabs[navbarProvider.selectedIndex],
      floatingActionButton: Container(
          height: 65,
          width: MediaQuery.of(context).size.width - (2 * 24),
          decoration: BoxDecoration(
            color: const Color(0xffF3F3F3),
            borderRadius: BorderRadius.circular(23),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: navBarItems.map(
              (item) {
                return NavbarWidget(
                  imageUrl: item.imageUrl!,
                  index: item.index!,
                );
              },
            ).toList(),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
