import 'package:cozy/providers/navbar_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class NavbarWidget extends StatefulWidget {
  String imageUrl;
  int index;
  NavbarWidget({
    required this.imageUrl,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  _NavbarWidgetState createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarProvider>(
      builder: (context, navbarProvider, child) => GestureDetector(
        onTap: () => navbarProvider.setSelectedIndex(widget.index),
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              widget.imageUrl,
              color: (navbarProvider.selectedIndex == widget.index)
                  ? purpleColor
                  : Color(0xff989BA1),
              width: 26,
            ),
            const Spacer(),
            Container(
              width: 30,
              height: 2,
              decoration: BoxDecoration(
                color: (navbarProvider.selectedIndex == widget.index)
                    ? purpleColor
                    : Color(0xff989BA1),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(1000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
